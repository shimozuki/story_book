class CeritaModel {
  final int id;
  final String title;
  final String ceritaIndo;
  final String ceritaSwq;
  final FeaturedImage featuredImage;
  final String background;
  final String featuredAudio;
  // final int active;
  final String userId;
  // final int featuredPost;
  // final String createdAt;
  // final String updatedAt;

  CeritaModel({
    required this.id,
    required this.title,
    required this.ceritaIndo,
    required this.ceritaSwq,
    required this.featuredImage,
    required this.background,
    required this.featuredAudio,
    required this.userId,
  });

  factory CeritaModel.fromJson(Map<String, dynamic> json) {
    return CeritaModel(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      ceritaIndo: json['cerita_indo'],
      ceritaSwq: json['cerita_swq'],
      featuredImage: FeaturedImage.fromJson(json['featured_image']),
      background: json['background'],
      featuredAudio: json['featured_audio'],
      userId: json['user_id'],
    );
  }
}

class FeaturedImage {
  final String original;
  final String thumb;
  final String medium;
  final String? url;

  FeaturedImage({
    required this.original,
    required this.thumb,
    required this.medium,
    required this.url,
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
