import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:droidknights/models/track_schedule.dart';


Future<String> _loadAScheduleAsset(String path) async {
  return await rootBundle.loadString(path);
}


Future<List<ScheduleModel>> loadSchedule(String path) async {
  String jsonString = await _loadAScheduleAsset(path);
  final jsonResponse = json.decode(jsonString);
  ScheduleListModel schedule = new ScheduleListModel.fromJson(jsonResponse);
  return schedule.list;
}