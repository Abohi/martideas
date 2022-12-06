import 'package:hooks_riverpod/hooks_riverpod.dart';

var isFirstTabStateProvider = StateProvider<bool>((ref)=>true);
var isSecondTabStateProvider = StateProvider<bool>((ref)=>false);
var isThirdTabStateProvider = StateProvider<bool>((ref)=>false);
var isForthTabStateProvider = StateProvider<bool>((ref)=>false);
var isFifthTabStateProvider = StateProvider<bool>((ref)=>false);