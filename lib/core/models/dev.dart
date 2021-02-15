class Dev {
  String name;
  List<String> roles;
  String about;
  String username;
  Socials socials;

  Dev({this.name, this.roles, this.about, this.username, this.socials});

  Dev.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roles = json['roles'].cast<String>();
    about = json['about'];
    username = json['username'];
    socials =
        json['socials'] != null ? new Socials.fromJson(json['socials']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roles'] = this.roles;
    data['about'] = this.about;
    data['username'] = this.username;
    if (this.socials != null) {
      data['socials'] = this.socials.toJson();
    }
    return data;
  }
}

class Socials {
  String twitter;
  String facebook;
  String linkedin;

  Socials({this.twitter, this.facebook, this.linkedin});

  Socials.fromJson(Map<String, dynamic> json) {
    twitter = json['twitter'] != null ? json['twitter'] : '';
    facebook = json['facebook'] != null ? json['facebook'] : '';
    linkedin = json['linkedin'] != null ? json['linkedin'] : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['twitter'] = this.twitter != null ? this.twitter : '';
    data['facebook'] = this.facebook != null ? this.facebook : '';
    data['linkedin'] = this.linkedin != null ? this.linkedin : '';
    return data;
  }
}
