import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:droidknights/models/track_schedule.dart';


Future<String> _loadAScheduleAsset() async {
  return await rootBundle.loadString('assets/json/schedule_track1.json');
}


Future<List<ScheduleModel>> loadSchedule() async {
  String jsonString = await _loadAScheduleAsset();
  final jsonResponse = json.decode(jsonString);
  ScheduleListModel schedule = new ScheduleListModel.fromJson(jsonResponse);
  return schedule.list;
}