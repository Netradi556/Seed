import 'package:flutter_riverpod/flutter_riverpod.dart';

final isReloadProvider = StateProvider<bool>((ref) => true);
final isLoadingProvider = StateProvider<bool>((ref) => false);
