class Activity {
  String? activity;
  String? module;
  String? type;
  String? day;
  String? start;
  String? end;
  String? duration;
  String? room;
  String? roomDescription;
  String? roomSize;
  String? staff;
  String? weeks;

  Activity(
      {this.activity,
      this.module,
      this.type,
      this.day,
      this.start,
      this.end,
      this.duration,
      this.room,
      this.roomDescription,
      this.roomSize,
      this.staff,
      this.weeks});

  Activity.fromJson(Map<String, dynamic> json) {
    activity = json['Activity'];
    module = json['Module'];
    type = json['Type'];
    day = json['Day'];
    start = json['Start'];
    end = json['End'];
    duration = json['Duration'];
    room = json['Room'];
    roomDescription = json['Room Description'];
    roomSize = json['Room Size'];
    staff = json['Staff'];
    weeks = json['Weeks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Activity'] = activity;
    data['Module'] = module;
    data['Type'] = type;
    data['Day'] = day;
    data['Start'] = start;
    data['End'] = end;
    data['Duration'] = duration;
    data['Room'] = room;
    data['Room Description'] = roomDescription;
    data['Room Size'] = roomSize;
    data['Staff'] = staff;
    data['Weeks'] = weeks;
    return data;
  }
}