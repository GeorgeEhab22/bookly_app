class BookEntity {
  final String bookId;
  final String? image;
  final String title;
  final String? author;
  final num rating;
  final num? price;
  final num? count;
  const BookEntity(
    { required this.count,
    required this.bookId,
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
  });
}
