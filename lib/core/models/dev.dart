class Dev {
  String name;
  List<String> roles;
  String about;
  String username;

  Dev({this.name, this.roles, this.about});

  Dev.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roles = json['roles'].cast<String>();
    about = json['about'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roles'] = this.roles;
    data['about'] = this.about;
    data['username'] = this.username;
    return data;
  }
}
