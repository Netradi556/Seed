import 'package:flutter_riverpod/flutter_riverpod.dart';

// BottomNavigationBarの状態を保持するためのProvider
final navigationIndexProvider = StateProvider((ref) => 0);

// UserTopのGridViewの更新を管理するためのProvider
final gridViewStateProvider = StateProvider((ref) => true);
