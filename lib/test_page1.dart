import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:seed_app/ui/top/search.dart';

// DropdownWidgetで使用中============================================
final selectProvider = StateProvider((ref) => true);
final selectedItemProvider = StateProvider((ref) => []);

// ページネーションで使用中============================================
final testPostsProvider =
    StateNotifierProvider<TestPostsNotifier, List<TestModel>>(
        (ref) => TestPostsNotifier());
final reloadProvider = StateProvider<bool>((ref) => true);
final isLoadProvider = StateProvider<bool>((ref) => false);

@immutable
class TestModel {
  const TestModel(
      this.handleName, this.birthDate, this.greetingMessage, this.sex);

  final String handleName;
  final Timestamp birthDate;
  final String greetingMessage;
  final String sex;
}

class TestPostsNotifier extends StateNotifier<List<TestModel>> {
  TestPostsNotifier() : super([]) {
    fetchFirstPosts();
  }

  // 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  // 最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstPosts() async {
    final snapshots = await FirebaseFirestore.instance
        .collection('TestData')
        .orderBy('birthDate')
        .limit(20)
        .get();

    fetchedLastDoc = snapshots.docs.last;
    state = [
      ...snapshots.docs.map(
        (e) => TestModel(
          e.data()['handleName'],
          e.data()['birthDate'],
          e.data()['greetingMessage'],
          e.data()['sex'],
        ),
      )
    ];

    print('fetch First');
  }

  // 次のドキュメントを読み込む
  Future<void> fetchPosts() async {
    final snapshots = await FirebaseFirestore.instance
        .collection('TestData')
        .orderBy('birthDate')
        .startAfterDocument(fetchedLastDoc!)
        .limit(20)
        .get();

    fetchedLastDoc = snapshots.docs.last;
    state = [
      ...state,
      ...snapshots.docs.map(
        (e) => TestModel(
          e.data()['handleName'],
          e.data()['birthDate'],
          e.data()['greetingMessage'],
          e.data()['sex'],
        ),
      )
    ];
  }
}

class TestPage3 extends ConsumerWidget {
  TestPage3({Key? key}) : super(key: key);
  final List<String> items = [
    '300万円',
    '400万円',
    '500万円',
    '600万円',
  ];
  List<String> selectedItem = []; // TODO: Providerで情報保持

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DropdownWidget用のProvider
    final selectedState = ref.watch(selectProvider.state);
    final selectedItemState = ref.watch(selectedItemProvider.state);

    // ページネーション用のProvider
    final state = ref.watch(testPostsProvider);
    final reloadState = ref.watch(reloadProvider.state);
    final isLoadState = ref.watch(isLoadProvider.state);

    scrollController.addListener(
      () {
        if (isLoadState.state == false) {
          if (scrollController.offset ==
              scrollController.position.maxScrollExtent) {
            isLoadState.state = true;
            ref.read(testPostsProvider.notifier).fetchPosts();
            reloadState.state = !reloadState.state;
            print('取得');
            Future.delayed(
              const Duration(seconds: 2),
              (() {
                print('３秒経過');
                isLoadState.state = false;
              }),
            );
          }
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: NewInfiniteGridView(),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                controller: scrollController,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final item = state.elementAt(index);
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(item.handleName),
                      ),
                      title: Text(item.birthDate.toString()),
                    ),
                  );
                },
              ),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                hint: const Align(
                  alignment: Alignment.center,
                  child: Text('selectedItem'),
                ),
                value: selectedItemState.state.isEmpty
                    ? null
                    : selectedItemState.state
                        .last, //selectedItem.isEmpty ? null : selectedItem.last,
                onChanged: (value) {},
                buttonHeight: 40,
                buttonWidth: 140,
                itemPadding: EdgeInsets.zero,
                selectedItemBuilder: (context) {
                  return items.map(
                    (item) {
                      return Container(
                        alignment: AlignmentDirectional.center,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          selectedItemState.state
                              .join(', '), // selectedItem.join(', '),
                          style: const TextStyle(
                              fontSize: 14, overflow: TextOverflow.ellipsis),
                        ),
                      );
                    },
                  ).toList();
                },
                items: items.map(
                  (item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      enabled: false,
                      child: StatefulBuilder(builder: ((context, menuSetState) {
                        final _isSelected = selectedItemState.state
                            .contains(item); // selectedItem.contains(item);
                        return InkWell(
                          onTap: () {
                            _isSelected
                                ? selectedItemState.state.remove(item)
                                : selectedItemState.state.add(item);
/*                             ? selectedItem.remove(item)
                                : selectedItem.add(
                                    item); */ // =============================Providerで情報保持
                            menuSetState(() {});
                            selectedState.state = !selectedState.state;
                            print(selectedItemState.state.toString());
                          },
                          child: Container(
                            height: double.infinity,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                _isSelected
                                    ? const Icon(Icons.check_box_outlined)
                                    : const Icon(Icons.check_box_outline_blank),
                                const SizedBox(width: 16),
                                Text(item, style: const TextStyle(fontSize: 14))
                              ],
                            ),
                          ),
                        );
                      })),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
















 */
class SearchItemsTest {
  String item1;
  String item2;
  int? item3;

  SearchItemsTest(
    this.item1,
    this.item2, {
    this.item3,
  });
}

class SearchCriteriaNotifier extends StateNotifier<SearchItemsTest> {
  SearchCriteriaNotifier() : super(SearchItemsTest('', ''));

  void setStringToItem1(String param) {
    state = SearchItemsTest(param, state.item2);
  }
}

final searchCriteriaProvider =
    StateNotifierProvider<SearchCriteriaNotifier, SearchItemsTest>(
  ((ref) {
    return SearchCriteriaNotifier();
  }),
);

class TestPage2 extends ConsumerWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final test = ref.watch(searchCriteriaProvider);
    final test2 = ref.read(searchCriteriaProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: InkWell(
        onTap: () {
          test2.setStringToItem1('ああaあ');
          print(test.item1.toString());
        },
        child: Container(
          width: 100,
          height: 40,
          color: Colors.amberAccent,
          child: Text(
            test.item1.toString(),
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

/*
















 */

// StateProviderで利用
final counterProvider = StateProvider((ref) => 0);

// Todoクラスはfreezedで生成済み（コードの末）
// StateNotifierProviderの値を変更する処理をこの中に記述していく
// 今回扱うのはTodoクラスのListで、メソッドは3つ
class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  // 新しいTODOを追加するメソッド
  void add(Todo todo) {
    state = [...state, todo];
  }

  // IDを指定して、TODOを削除するメソッド
  // 合致するID以外の要素をリストに格納し直す
  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // IDを指定して、TODOの完了状態を切り替えるメソッド
  // copyWithを利用して、完了状態だけ変更された別のオブジェクトを格納する
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

// StateNotifierProvider<処理を実装したクラス=Notifierのクラスの型, 扱いたい状態の型>
// ignore: non_constant_identifier_names
final TodoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TestPage extends ConsumerWidget {
  const TestPage({Key? key}) : super(key: key);
  final Color appBarIconColor = const Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateProviderで利用
    // ignore: unused_local_variable
    final counter = ref.watch(counterProvider.notifier);
    // ignore: unused_local_variable
    final counterText = ref.watch(counterProvider);

    // StateNotifierProviderで利用
    final todoList = ref.watch(TodoListNotifierProvider);
    final notifier = ref.watch(TodoListNotifierProvider.notifier);

    return StateNotifierProviderSample(
        appBarIconColor: appBarIconColor,
        todoList: todoList,
        notifier: notifier);
  }
}

class StateNotifierProviderSample extends StatelessWidget {
  const StateNotifierProviderSample({
    Key? key,
    required this.appBarIconColor,
    required this.todoList,
    required this.notifier,
  }) : super(key: key);

  final Color appBarIconColor;
  final List<Todo> todoList;
  final TodoListNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text('テストルーム', style: TextStyle(color: Colors.black87)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shield),
            color: appBarIconColor,
          )
        ],
      ),
      body: ListView.builder(
        // "todoList"の型はList<todo>なので.lengthが使える
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index]; // List<todo>からtodoを取り出す
          return ListTile(
            title: Text(todo.title), // 取り出したtodoのtitleプロパティ
            leading: Icon(todo.completed
                ? Icons.check_box
                : Icons
                    .check_box_outline_blank), // 取り出したtodoのcompletedプロパティ（bool）で条件分岐
            trailing: TextButton(
              onPressed: () =>
                  notifier.remove(todo.id), // メソッドを利用するときは.notifierをつけたほうを利用
              child: const Text('Delete'),
            ),
            onTap: () =>
                notifier.toggle(todo.id), // メソッドを利用するときは.notifierをつけたほうを利用
          );
        },
      ),
    );
  }
}

class StateProviderSample extends StatelessWidget {
  const StateProviderSample({
    Key? key,
    required this.appBarIconColor,
    required this.counter,
    required this.counterText,
  }) : super(key: key);

  final Color appBarIconColor;
  final StateController<int> counter;
  final int counterText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        title: const Text('テストルーム', style: TextStyle(color: Colors.black87)),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shield),
            color: appBarIconColor,
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => counter.update((state) => state + 1),
                child: Text('Count : $counterText'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//================================================================================================
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return _Todo.fromJson(json);
}

/// @nodoc
mixin _$Todo {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoCopyWith<Todo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoCopyWith<$Res> {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) then) =
      _$TodoCopyWithImpl<$Res>;
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class _$TodoCopyWithImpl<$Res> implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._value, this._then);

  final Todo _value;
  // ignore: unused_field
  final $Res Function(Todo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$$_TodoCopyWith(_$_Todo value, $Res Function(_$_Todo) then) =
      __$$_TodoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class __$$_TodoCopyWithImpl<$Res> extends _$TodoCopyWithImpl<$Res>
    implements _$$_TodoCopyWith<$Res> {
  __$$_TodoCopyWithImpl(_$_Todo _value, $Res Function(_$_Todo) _then)
      : super(_value, (v) => _then(v as _$_Todo));

  @override
  _$_Todo get _value => super._value as _$_Todo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_Todo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Todo with DiagnosticableTreeMixin implements _Todo {
  const _$_Todo(
      {required this.id, required this.title, this.completed = false});

  factory _$_Todo.fromJson(Map<String, dynamic> json) => _$$_TodoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Todo(id: $id, title: $title, completed: $completed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Todo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Todo &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.completed, completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(completed));

  @JsonKey(ignore: true)
  @override
  _$$_TodoCopyWith<_$_Todo> get copyWith =>
      __$$_TodoCopyWithImpl<_$_Todo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoToJson(this);
  }
}

abstract class _Todo implements Todo {
  const factory _Todo(
      {required final String id,
      required final String title,
      final bool completed}) = _$_Todo;

  factory _Todo.fromJson(Map<String, dynamic> json) = _$_Todo.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  bool get completed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodoCopyWith<_$_Todo> get copyWith => throw _privateConstructorUsedError;
}

_$_Todo _$$_TodoFromJson(Map json) => _$_Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
