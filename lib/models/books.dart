// Model class of the Book

class Book {
  int? id;
  String? title;
  String? author;
  String? genre;
  String? description;
  String? isbn;
  String? image;
  String? published;
  String? publisher;
  bool? isFavorite;

  Book(
      {this.id,
      this.title,
      this.author,
      this.genre,
      this.description,
      this.isbn,
      this.image,
      this.published,
      this.publisher});

  /// Creates a new instance of [Book] from json [Map]
  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    genre = json['genre'];
    description = json['description'];
    isbn = json['isbn'];
    image = json['image'];
    published = json['published'];
    publisher = json['publisher'];
    isFavorite = false;
  }
}
