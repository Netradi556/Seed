import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// DropdownWidgetで使用中============================================
final selectProvider = StateProvider((ref) => true);
final selectedItemProvider = StateProvider((ref) => []);

class TestPage4 extends ConsumerWidget {
  TestPage4({Key? key}) : super(key: key);

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
    final selectedItemState = ref.watch(selectedItemProvider.state);
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
                buttonWidth: 300,
                itemPadding: EdgeInsets.zero,
                // 選択されている時の表示内容
                selectedItemBuilder: (context) {
                  return items.map(
                    (item) {
                      return Container(
                        color: Colors.amber, // TODO: 選択時のカラーを設定する
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                // 選択中とそうでない場合のアイコン
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
            : selectedItemState
                .state.last, //selectedItem.isEmpty ? null : selectedItem.last,
        onChanged: (value) {},
        buttonHeight: 40,
        buttonWidth: 300,
        itemPadding: EdgeInsets.zero,
        // 選択されている時の表示内容
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                color: Colors.amber, // TODO: 選択時のカラーを設定する
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
    );
  }
}
