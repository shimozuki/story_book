class DetailModel {
  int id;
  String title;
  String ceritaIndo;
  String ceritaSwq;
  FeaturedImage featuredImage;
  String background;
  String featuredAudio;
  String active;
  String userId;
  String name;
  String featuredPost;
  DateTime createdAt;
  DateTime updatedAt;
  

  DetailModel({
    required this.id,
    required this.title,
    required this.ceritaIndo,
    required this.ceritaSwq,
    required this.featuredImage,
    required this.background,
    required this.featuredAudio,
    required this.active,
    required this.userId,
    required this.name,
    required this.featuredPost,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      id: json['id'],
      title: json['title'],
      ceritaIndo: json['cerita_indo'],
      ceritaSwq: json['cerita_swq'],
      featuredImage: FeaturedImage.fromJson(json['featured_image']),
      background: json['background'],
      featuredAudio: json['featured_audio'],
      active: json['active'],
      userId: json['user_id'],
      name: json['name'],
      featuredPost: json['featured_post'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class FeaturedImage {
  String original;
  String thumb;
  String medium;
  String? url;

  FeaturedImage({
    required this.original,
    required this.thumb,
    required this.medium,
    this.url,
  });

  factory FeaturedImage.fromJson(Map<String, dynamic> json) {
    return FeaturedImage(
      original: json['original'],
      thumb: json['thumb'],
      medium: json['medium'],
      url: json['url'],
    );
  }
}
