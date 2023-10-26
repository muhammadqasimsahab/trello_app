import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListGenerator extends Notifier<List<String>> {
  @override
  List<String> build() {
    //TODO: implement build
    return [];
  }

  void addString(String randomStr) {
    state = [...state, randomStr];
  }
}
//
// var strNotifierProvider =
//     NotifierProvider<RandomStringGenerator List<Strinf> >(RandomStringGenerator.new);
