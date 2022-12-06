import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../repositories/auth_repository.dart';
import '../repositories/ideas_repository.dart';

final authRepositoryProvider =
Provider<AuthRepository>((ref) => AuthRepository(ref));
final ideasRepositoryProvider =
Provider<IdeasRepository>((ref) => IdeasRepository(ref));