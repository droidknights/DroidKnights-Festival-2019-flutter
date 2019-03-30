class ScheduleListModel {
  final List<ScheduleModel> list;

  ScheduleListModel({this.list});

  factory ScheduleListModel.fromJson(List<dynamic> parsedJson) {
    List<ScheduleModel> lists = new List<ScheduleModel>();
    lists = parsedJson.map((i) => ScheduleModel.fromJson(i)).toList();

    return ScheduleListModel(list: lists);
  }
}

class ScheduleModel {
  final int type;
  final String title;
  final String time;
  final List<SpeakerModel> speakers;
  final String contents;

  List<String> get names => speakers.map((speaker) => speaker.name).toList();
  List<String> get avatarUrls =>
      speakers.map((speaker) => speaker.avatarUrl).toList();

  ScheduleModel(
      {this.type, this.title, this.time, this.speakers, this.contents});

  factory ScheduleModel.fromJson(Map<String, dynamic> parsedJson) {
    final List<SpeakerModel> speakers = (parsedJson['speakers'] as List)
            ?.map((e) => e == null
                ? null
                : SpeakerModel.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [];
    return ScheduleModel(
        type: parsedJson['type'],
        title: parsedJson['title'],
        time: parsedJson['time'],
        speakers: speakers,
        contents: parsedJson['contents']);
  }
}

class SpeakerModel {
  final String name;
  final String avatarUrl;

  SpeakerModel({this.name, this.avatarUrl});

  factory SpeakerModel.fromJson(Map<String, dynamic> parsedJson) {
    return SpeakerModel(
      name: parsedJson['name'],
      avatarUrl: parsedJson['avatarUrl'],
    );
  }
}
