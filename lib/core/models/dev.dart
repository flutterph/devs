class Dev {
  String name;
  List<String> roles;
  String about;

  Dev({this.name, this.roles, this.about});

  Dev.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roles = json['roles'].cast<String>();
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['roles'] = this.roles;
    data['about'] = this.about;
    return data;
  }
}
