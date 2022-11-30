class TeamModel {
  String? uid;
  String name;
  String email;
  int phone;
  String section;
  String role;
  String? image;
  TeamModel({
    this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.section,
    required this.role,
    this.image,
  });

//data from Server

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      section: map['section'],
      role: map['role'],
      image: map['image'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'section': section,
      'role': role,
      'image': image,
    };
  }
}
