class BookDto {
  BookDto({
    required this.author,
    required this.bookImage,
    required this.createdDate,
    required this.description,
    required this.price,
    required this.publisher,
    required this.title,
    required this.updatedDate,
  });

  final String author;
  final String bookImage;
  final DateTime createdDate;
  final String description;
  final String price;
  final String publisher;
  final String title;
  final DateTime updatedDate;

  factory BookDto.fromJson(Map<String, dynamic> json) => BookDto(
        author: json["author"],
        bookImage: json["book_image"],
        createdDate: DateTime.parse(json["created_date"]),
        description: json["description"],
        price: json["price"],
        publisher: json["publisher"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "book_image": bookImage,
        "created_date": createdDate.toIso8601String(),
        "description": description,
        "price": price,
        "publisher": publisher,
        "title": title,
        "updated_date": updatedDate.toIso8601String(),
      };
}
