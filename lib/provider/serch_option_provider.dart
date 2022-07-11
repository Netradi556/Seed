import 'package:flutter_riverpod/flutter_riverpod.dart';

final idProofProvider = StateProvider(((ref) => false));
final incomeProofProvider = StateProvider(((ref) => false));
final bacheloretteProofProvider = StateProvider(((ref) => false));

final optionProvider = StateNotifierProvider<OptionNotifier, Map<String, dynamic>>((ref) => {});

class OptionNotifier extends StateNotifier<Map<String, dynamic>>{
    OptionNotifier() : super({});

    // TODO: 検索条件をタップした時の処理
    void updateOption(String itemName, dynamic element) {
        // TODO: Mapから削除する処理
        // elementが特定の値（＝全項目共通、または所定のいくつかの値）であれば
        // itemNameの要素を削除する、SwithcでもOK
        // if (element = '特定の値') {
        //      state.remove('itemName');
        //  }

    }

    // 検索条件をリセットする処理
    void deleteOption() {
        state.forEach((key, value) {
            state.remove(key);
        });
    }



}



