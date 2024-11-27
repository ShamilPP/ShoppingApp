class CleaningService {
  final int id;
  final String imageUrl;
  final String title;
  final String duration;
  final double price;
  final double rating;
  final int orders;

  CleaningService(
      {required this.id, required this.imageUrl, required this.title, required this.duration, required this.price, required this.rating, required this.orders});

  factory CleaningService.fromJson(Map<String, dynamic> json) {
    return CleaningService(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      orders: json['orders'] as int,
    );
  }
}
