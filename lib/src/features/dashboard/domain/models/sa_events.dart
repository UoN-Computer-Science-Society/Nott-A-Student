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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Date'] = date;
    data['Title'] = title;
    data['Club'] = club;
    data['Venue'] = venue;
    data['Start Time'] = startTime;
    data['End Time'] = endTime;
    data['Description'] = description;
    data['Image'] = image;
    data['Signup Link'] = signupLink;
    data['Club Instagram'] = clubInstagram;
    return data;
  }
}
