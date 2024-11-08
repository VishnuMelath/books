class BookModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final String author;
  final String coverPictureURL;
  final DateTime publishedDate;
  final double rating;

  BookModel(
      {required this.id,
      required this.title,
      required this.coverPictureURL,
      required this.description,
      required this.price,
      required this.author,
      required this.rating,
      required this.publishedDate});

  factory BookModel.fromJson(Map<String, dynamic> data) {
    return BookModel(
        id: data['id'],
        title: data['title'],
        coverPictureURL: data['coverPictureURL'],
        description: data['description'],
        price: data['price'],
        author: data['author'],
        rating: data['rating'],
        publishedDate: data['publishedDate']);
  }
}
