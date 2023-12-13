class AboutModel {
  int id;
  int userId;
  String imageTitle;
  String imageDesc;
  String image;
  bool active;
  DateTime createdAt;
  DateTime updatedAt;

  AboutModel({
    required this.id,
    required this.userId,
    required this.imageTitle,
    required this.imageDesc,
    required this.image,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      id: json['id'] ?? 0, // Use a default value (e.g., 0) if 'id' is null
      userId: json['user_id'] ?? 0, // Use a default value if 'user_id' is null
      imageTitle: json['image_title'] ?? '',
      imageDesc: json['image_desc'] ?? '',
      image: json['image'] ?? '',
      active:
          json['active'] ?? false, // Use a default value if 'active' is null
      createdAt: DateTime.parse(json['created_at'] ??
          ''), // Use a default value if 'created_at' is null
      updatedAt: DateTime.parse(json['updated_at'] ??
          ''), // Use a default value if 'updated_at' is null
    );
  }
}
