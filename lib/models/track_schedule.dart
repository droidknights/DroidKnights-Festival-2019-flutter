class ScheduleListModel{
  final List<ScheduleModel> list;

  ScheduleListModel({this.list});

  factory ScheduleListModel.fromJson(List<dynamic> parsedJson) {
    List<ScheduleModel> lists = new List<ScheduleModel>();
    lists = parsedJson.map((i)=>ScheduleModel.fromJson(i)).toList();

    return ScheduleListModel(
        list: lists
    );
  }
}
class ScheduleModel{
  final int type;
  final String name;
  final String title;
  final String time;
  final String avatarUrl;
  final String contents;

  ScheduleModel({this.type, this.name, this.title, this.time, this.avatarUrl, this.contents});

  factory ScheduleModel.fromJson(Map<String, dynamic> parsedJson){
    return ScheduleModel(
        type: parsedJson['type'],
        name: parsedJson['name'],
        title: parsedJson['title'],
        time: parsedJson ['time'],
        avatarUrl: parsedJson['avatarUrl'],
        contents: parsedJson ['contents']
    );
  }
}