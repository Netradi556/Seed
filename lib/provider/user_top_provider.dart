import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seed_app/repository/firestore_repo.dart';

final isReloadProvider = StateProvider<bool>((ref) => true);
final isLoadingProvider = StateProvider<bool>((ref) => false);
final isMaxProvider = StateProvider<bool>((ref) => false);
//
//
//
final snapshotProvider =
    StateNotifierProvider<SnapShotNotifier, List<DocumentSnapshot>>(
        (ref) => SnapShotNotifier());

//
//
//
//
//
//
//
class SnapShotNotifier extends StateNotifier<List<DocumentSnapshot>> {
  SnapShotNotifier() : super([]) {
    fetchFirstUsers();
  }

  // 現在取得している最後のドキュメントを保持
  DocumentSnapshot? fetchedLastDoc;

  // TODO: 検索条件を指定された場合の操作を後から実装

  // 最初に表示するためのドキュメントを読み込む
  Future<void> fetchFirstUsers() async {
    final QuerySnapshot snapshots =
        await FireStoreRepo().fetchFirstUsers().get();

    fetchedLastDoc = snapshots.docs.last;
    state = [...snapshots.docs];
    // TODO:最初から20件未満のドキュメントを取得した場合は、ユーザーに上限到達の通知ができない
  }

  // 次のドキュメントを読み込む
  Future<String> fetchUsers() async {
    final snapshots = await FireStoreRepo().fetchUsers(fetchedLastDoc!).get();
    if (snapshots.size != 0) {
      state = [...state, ...snapshots.docs];
      fetchedLastDoc = snapshots.docs.last;
      return 'OK';
    } else {
      return 'MAX';
    }
  }
}
