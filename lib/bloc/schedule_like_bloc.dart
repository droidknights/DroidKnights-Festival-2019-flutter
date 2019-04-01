import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './bloc_provider.dart';

class ScheduleLikeBloc implements BlocBase {
  final _likeMap = BehaviorSubject<Map<String, dynamic>>();
  Observable<Map<String, dynamic>> get $likeMap => _likeMap.stream;
  Base64Codec _base64 = Base64Codec();
  Utf8Codec _utf8 = Utf8Codec();
  Map<String, dynamic> _map = {};
  SharedPreferences prefs;

  ScheduleLikeBloc() {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
    _map = json.decode(prefs.getString('dkf_schedule_like_map') ?? "{}");
    _likeMap.add(_map);
  }

  Future<bool> addLike(String id) {
    _map[toBase64(id)] = true;
    _likeMap.add(_map);
    prefs.setString('dkf_schedule_like_map', json.encode(_map));
    return prefs.commit();
  }

  Future<bool> removeLike(String id) {
    _map.remove(toBase64(id));
    _likeMap.add(_map);
    prefs.setString('dkf_schedule_like_map', json.encode(_map));
    return prefs.commit();
  }

  @override
  void dispose() {
    _likeMap.close();
  }

  String toBase64(String str) {
    return _base64.encode(_utf8.encode(str));
  }

  String fromBase64(String str) {
    return _base64.decode(str).toString();
  }
}
