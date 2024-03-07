class SAEvents {
  String? date;
  String? title;
  String? club;
  String? venue;
  String? startTime;
  String? endTime;
  String? description;
  String? image;
  String? signupLink;
  String? clubInstagram;

  SAEvents(
      {this.date,
      this.title,
      this.club,
      this.venue,
      this.startTime,
      this.endTime,
      this.description,
      this.image,
      this.signupLink,
      this.clubInstagram});

  SAEvents.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    title = json['Title'];
    club = json['Club'];
    venue = json['Venue'];
    startTime = json['Start Time'];
    endTime = json['End Time'];
    description = json['Description'];
    image = json['Image'];
    signupLink = json['Signup Link'];
    clubInstagram = json['Club Instagram'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Title'] = this.title;
    data['Club'] = this.club;
    data['Venue'] = this.venue;
    data['Start Time'] = this.startTime;
    data['End Time'] = this.endTime;
    data['Description'] = this.description;
    data['Image'] = this.image;
    data['Signup Link'] = this.signupLink;
    data['Club Instagram'] = this.clubInstagram;
    return data;
  }
}
