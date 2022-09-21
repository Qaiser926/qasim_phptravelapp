class UserModels {
  final String? id;
  final DateTime? createdAt;
  // final String? name;
  final String? avatar;

  UserModels({this.id, this.createdAt, this.avatar});

  factory UserModels.fromJson(Map<String, dynamic> json) {
    if (json == null) return null!;
    return UserModels(
      id: json["id"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      // name: json["name"],
      avatar: json["avatar"],
    );
  }

  static List<UserModels> fromJsonList(List list) {
    if (list == null) return null!;
    return list.map((item) => UserModels.fromJson(item)).toList();
  }

  ///this method will prevent the override of toString
  String userAsString() {
    return '#${this.id} ';
  }

  ///this method will prevent the override of toString
  bool userFilterByCreationDate(String filter) {
    return this.createdAt.toString().contains(filter);
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(UserModels model) {
    return this.id == model.id;
  }

  // @override
  // String toString() => name!;
}
