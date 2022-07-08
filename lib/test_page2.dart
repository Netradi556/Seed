import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// DropdownWidgetで使用中============================================
final selectProvider = StateProvider.autoDispose((ref) => true);
final selectedItemProvider = StateProvider.autoDispose((ref) => []);

// TODO: AutoDisposeを使った状態の破棄を実装する
class TestPage4 extends ConsumerWidget {
  const TestPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TemplateDropDown(),
            SingleChoiceDropDown(),
          ],
        ),
      ),
    );
  }
}

//
//
//
//
//
//

class TemplateDropDown extends ConsumerWidget {
  TemplateDropDown({Key? key}) : super(key: key);

  // 選択肢のリスト
  final List<String> items = [
    '300万円aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    '400万円',
    '500万円',
    '600万円',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DropdownWidget用のProvider
    final selectedState = ref.watch(selectProvider.state);
    final selectedItemState = ref.watch(selectedItemProvider.state);

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: const Align(
          alignment: Alignment.center,
          child: Text('selectedItem'),
        ),
        value: selectedItemState.state.isEmpty
            ? null
            : selectedItemState.state.last,
        onChanged: (value) {},
        buttonHeight: 40,
        buttonWidth: 300,
        itemPadding: EdgeInsets.zero,
        // 選択されている時の表示内容
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 224, 130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  // 複数選択されているときはjoinで結合
                  selectedItemState.state.join(', '),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                    // TODO: 単一選択と、複数選択とで処理を変える
                    _isSelected
                        ? selectedItemState.state.remove(item)
                        : selectedItemState.state.add(item);
                    menuSetState(() {});
                    selectedState.state = !selectedState.state;
                    print(selectedItemState.state.toString());
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // 選択中とそうでない場合のアイコン
                        _isSelected
                            ? const Icon(Icons.check_box_outlined)
                            : const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: 16),

                        // TODO: テキストを折り返すように変更
                        SizedBox(
                          width: 200,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, overflow: TextOverflow.visible),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            );
          },
        ).toList(),
      ),
    );
  }
}

final singleSelectedItemProvider = StateProvider((ref) => '');

class SingleChoiceDropDown extends ConsumerWidget {
  SingleChoiceDropDown({Key? key}) : super(key: key);

  // 選択肢のリスト
  final List<String> items = [
    '300万円',
    '400万円',
    '500万円',
    '600万円',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // DropdownWidget用のProvider
    final selectedState = ref.watch(selectProvider.state);
    final singleSelectedItemState = ref.watch(singleSelectedItemProvider.state);

    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: const Align(
          alignment: Alignment.center,
          child: Text('selectedItem'),
        ),
        value: singleSelectedItemState.state.isEmpty
            ? null
            : singleSelectedItemState.state,
        onChanged: (value) {},
        buttonHeight: 40,
        buttonWidth: 300,
        itemPadding: EdgeInsets.zero,
        // 選択されている時の表示内容
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                alignment: AlignmentDirectional.center,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 224, 130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  // 複数選択されているときはjoinで結合
                  singleSelectedItemState.state.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
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
                return InkWell(
                  onTap: () {
                    singleSelectedItemState.state = item;
                    menuSetState(() {});
                    selectedState.state = !selectedState.state;
                    print(singleSelectedItemState.state.toString());
                  },
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // TODO: テキストを折り返すように変更
                        SizedBox(
                          width: 200,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, overflow: TextOverflow.visible),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            );
          },
        ).toList(),
      ),
    );
  }
}
