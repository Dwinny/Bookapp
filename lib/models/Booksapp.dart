// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

Books? booksFromJson(String str) => Books.fromJson(json.decode(str));

String booksToJson(Books? data) => json.encode(data!.toJson());

class Books {
  Books({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  String? status;
  String? copyright;
  int? numResults;
  Results? results;

  Books copyWith({
    String? status,
    String? copyright,
    int? numResults,
    Results? results,
  }) =>
      Books(
        status: status ?? this.status,
        copyright: copyright ?? this.copyright,
        numResults: numResults ?? this.numResults,
        results: results ?? this.results,
      );

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": results!.toJson(),
      };
}

class Results {
  Results({
    this.bestsellersDate,
    this.publishedDate,
    this.publishedDateDescription,
    this.previousPublishedDate,
    this.nextPublishedDate,
    this.lists,
  });

  DateTime? bestsellersDate;
  DateTime? publishedDate;
  String? publishedDateDescription;
  DateTime? previousPublishedDate;
  String? nextPublishedDate;
  List<ListElement?>? lists;

  Results copyWith({
    DateTime? bestsellersDate,
    DateTime? publishedDate,
    String? publishedDateDescription,
    DateTime? previousPublishedDate,
    String? nextPublishedDate,
    List<ListElement?>? lists,
  }) =>
      Results(
        bestsellersDate: bestsellersDate ?? this.bestsellersDate,
        publishedDate: publishedDate ?? this.publishedDate,
        publishedDateDescription:
            publishedDateDescription ?? this.publishedDateDescription,
        previousPublishedDate:
            previousPublishedDate ?? this.previousPublishedDate,
        nextPublishedDate: nextPublishedDate ?? this.nextPublishedDate,
        lists: lists ?? this.lists,
      );

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        publishedDateDescription: json["published_date_description"],
        previousPublishedDate: DateTime.parse(json["previous_published_date"]),
        nextPublishedDate: json["next_published_date"],
        lists: json["lists"] == null
            ? []
            : List<ListElement?>.from(
                json["lists"]!.map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bestsellers_date":
            "${bestsellersDate!.year.toString().padLeft(4, '0')}-${bestsellersDate!.month.toString().padLeft(2, '0')}-${bestsellersDate!.day.toString().padLeft(2, '0')}",
        "published_date":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "published_date_description": publishedDateDescription,
        "previous_published_date":
            "${previousPublishedDate!.year.toString().padLeft(4, '0')}-${previousPublishedDate!.month.toString().padLeft(2, '0')}-${previousPublishedDate!.day.toString().padLeft(2, '0')}",
        "next_published_date": nextPublishedDate,
        "lists": lists == null
            ? []
            : List<dynamic>.from(lists!.map((x) => x!.toJson())),
      };
}

class ListElement {
  ListElement({
    this.listId,
    this.listName,
    this.listNameEncoded,
    this.displayName,
    this.updated,
    this.listImage,
    this.listImageWidth,
    this.listImageHeight,
    this.books,
  });

  int? listId;
  String? listName;
  String? listNameEncoded;
  String? displayName;
  Updated? updated;
  dynamic listImage;
  dynamic listImageWidth;
  dynamic listImageHeight;
  List<Book?>? books;

  ListElement copyWith({
    int? listId,
    String? listName,
    String? listNameEncoded,
    String? displayName,
    Updated? updated,
    dynamic listImage,
    dynamic listImageWidth,
    dynamic listImageHeight,
    List<Book?>? books,
  }) =>
      ListElement(
        listId: listId ?? this.listId,
        listName: listName ?? this.listName,
        listNameEncoded: listNameEncoded ?? this.listNameEncoded,
        displayName: displayName ?? this.displayName,
        updated: updated ?? this.updated,
        listImage: listImage ?? this.listImage,
        listImageWidth: listImageWidth ?? this.listImageWidth,
        listImageHeight: listImageHeight ?? this.listImageHeight,
        books: books ?? this.books,
      );

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        listId: json["list_id"],
        listName: json["list_name"],
        listNameEncoded: json["list_name_encoded"],
        displayName: json["display_name"],
        updated: updatedValues!.map[json["updated"]],
        listImage: json["list_image"],
        listImageWidth: json["list_image_width"],
        listImageHeight: json["list_image_height"],
        books: json["books"] == null
            ? []
            : List<Book?>.from(json["books"]!.map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_id": listId,
        "list_name": listName,
        "list_name_encoded": listNameEncoded,
        "display_name": displayName,
        "updated": updatedValues.reverse![updated],
        "list_image": listImage,
        "list_image_width": listImageWidth,
        "list_image_height": listImageHeight,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x!.toJson())),
      };
}

class Book {
  Book({
    this.ageGroup,
    this.amazonProductUrl,
    this.articleChapterLink,
    this.author,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.bookUri,
    this.contributor,
    this.contributorNote,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updatedDate,
    this.weeksOnList,
    this.buyLinks,
  });

  String? ageGroup;
  String? amazonProductUrl;
  String? articleChapterLink;
  dynamic? author;
  dynamic? bookImage;
  int? bookImageWidth;
  int? bookImageHeight;
  String? bookReviewLink;
  String? bookUri;
  String? contributor;
  String? contributorNote;
  DateTime? createdDate;
  String? description;
  String? firstChapterLink;
  String? price;
  String? primaryIsbn10;
  String? primaryIsbn13;
  String? publisher;
  int? rank;
  int? rankLastWeek;
  String? sundayReviewLink;
  dynamic title;
  DateTime? updatedDate;
  int? weeksOnList;
  List<BuyLink?>? buyLinks;

  Book copyWith({
    String? ageGroup,
    String? amazonProductUrl,
    String? articleChapterLink,
    String? author,
    String? bookImage,
    int? bookImageWidth,
    int? bookImageHeight,
    String? bookReviewLink,
    String? bookUri,
    String? contributor,
    String? contributorNote,
    DateTime? createdDate,
    String? description,
    String? firstChapterLink,
    String? price,
    String? primaryIsbn10,
    String? primaryIsbn13,
    String? publisher,
    int? rank,
    int? rankLastWeek,
    String? sundayReviewLink,
    String? title,
    DateTime? updatedDate,
    int? weeksOnList,
    List<BuyLink?>? buyLinks,
  }) =>
      Book(
        ageGroup: ageGroup ?? this.ageGroup,
        amazonProductUrl: amazonProductUrl ?? this.amazonProductUrl,
        articleChapterLink: articleChapterLink ?? this.articleChapterLink,
        author: author ?? this.author,
        bookImage: bookImage ?? this.bookImage,
        bookImageWidth: bookImageWidth ?? this.bookImageWidth,
        bookImageHeight: bookImageHeight ?? this.bookImageHeight,
        bookReviewLink: bookReviewLink ?? this.bookReviewLink,
        bookUri: bookUri ?? this.bookUri,
        contributor: contributor ?? this.contributor,
        contributorNote: contributorNote ?? this.contributorNote,
        createdDate: createdDate ?? this.createdDate,
        description: description ?? this.description,
        firstChapterLink: firstChapterLink ?? this.firstChapterLink,
        price: price ?? this.price,
        primaryIsbn10: primaryIsbn10 ?? this.primaryIsbn10,
        primaryIsbn13: primaryIsbn13 ?? this.primaryIsbn13,
        publisher: publisher ?? this.publisher,
        rank: rank ?? this.rank,
        rankLastWeek: rankLastWeek ?? this.rankLastWeek,
        sundayReviewLink: sundayReviewLink ?? this.sundayReviewLink,
        title: title ?? this.title,
        updatedDate: updatedDate ?? this.updatedDate,
        weeksOnList: weeksOnList ?? this.weeksOnList,
        buyLinks: buyLinks ?? this.buyLinks,
      );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        ageGroup: json["age_group"],
        amazonProductUrl: json["amazon_product_url"],
        articleChapterLink: json["article_chapter_link"],
        author: json["author"],
        bookImage: json["book_image"],
        bookImageWidth: json["book_image_width"],
        bookImageHeight: json["book_image_height"],
        bookReviewLink: json["book_review_link"],
        bookUri: json["book_uri"],
        contributor: json["contributor"],
        contributorNote: json["contributor_note"],
        createdDate: DateTime.parse(json["created_date"]),
        description: json["description"],
        firstChapterLink: json["first_chapter_link"],
        price: json["price"],
        primaryIsbn10: json["primary_isbn10"],
        primaryIsbn13: json["primary_isbn13"],
        publisher: json["publisher"],
        rank: json["rank"],
        rankLastWeek: json["rank_last_week"],
        sundayReviewLink: json["sunday_review_link"],
        title: json["title"],
        updatedDate: DateTime.parse(json["updated_date"]),
        weeksOnList: json["weeks_on_list"],
        buyLinks: json["buy_links"] == null
            ? []
            : List<BuyLink?>.from(
                json["buy_links"]!.map((x) => BuyLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "age_group": ageGroup,
        "amazon_product_url": amazonProductUrl,
        "article_chapter_link": articleChapterLink,
        "author": author,
        "book_image": bookImage,
        "book_image_width": bookImageWidth,
        "book_image_height": bookImageHeight,
        "book_review_link": bookReviewLink,
        "book_uri": bookUri,
        "contributor": contributor,
        "contributor_note": contributorNote,
        "created_date": createdDate?.toIso8601String(),
        "description": description,
        "first_chapter_link": firstChapterLink,
        "price": price,
        "primary_isbn10": primaryIsbn10,
        "primary_isbn13": primaryIsbn13,
        "publisher": publisher,
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "sunday_review_link": sundayReviewLink,
        "title": title,
        "updated_date": updatedDate?.toIso8601String(),
        "weeks_on_list": weeksOnList,
        "buy_links": buyLinks == null
            ? []
            : List<dynamic>.from(buyLinks!.map((x) => x!.toJson())),
      };
}

class BuyLink {
  BuyLink({
    this.name,
    this.url,
  });

  Name? name;
  String? url;

  BuyLink copyWith({
    Name? name,
    String? url,
  }) =>
      BuyLink(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory BuyLink.fromJson(Map<String, dynamic> json) => BuyLink(
        name: nameValues!.map[json["name"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "url": url,
      };
}

enum Name {
  AMAZON,
  APPLE_BOOKS,
  BARNES_AND_NOBLE,
  BOOKS_A_MILLION,
  BOOKSHOP,
  INDIE_BOUND
}

final nameValues = EnumValues({
  "Amazon": Name.AMAZON,
  "Apple Books": Name.APPLE_BOOKS,
  "Barnes and Noble": Name.BARNES_AND_NOBLE,
  "Bookshop": Name.BOOKSHOP,
  "Books-A-Million": Name.BOOKS_A_MILLION,
  "IndieBound": Name.INDIE_BOUND
});

enum Updated { WEEKLY, MONTHLY }

final updatedValues =
    EnumValues({"MONTHLY": Updated.MONTHLY, "WEEKLY": Updated.WEEKLY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
