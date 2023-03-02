import 'dart:developer';

import 'package:bookapp/controllers/book_list_controller.dart';
import 'package:bookapp/models/book.dart';
import 'package:bookapp/utilities/error.dart';
import 'package:provider/provider.dart';

import '../widgets/trendingbooks.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    try {
      await getPopularBooks();
    } on Failure catch (e) {
      log(e.message);
    }
  }

  Future<void> getPopularBooks() async {
    final controller = context.read<BookListController>();

    try {
      await controller.getBooks();
    } on Failure {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'EXPLORE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _PopularBooksSection(),
              _TrendingBooksSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class Iconmenu extends StatelessWidget {
  const Iconmenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        Text(
          'EXPLORE',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}

class _PopularBooksSection extends StatelessWidget {
  const _PopularBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookListController>(
      builder: (context, controller, _) {
        final books = controller.books;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Show All',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 380,
              child: ListView.separated(
                itemCount: books.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  final book = books[index];
                  return BookItem(book);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 20);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class BookItem extends StatelessWidget {
  const BookItem(this.bookDto, {super.key});

  final BookDto bookDto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          bookDto.bookImage,
          height: 320,
          width: 200,
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  bookDto.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Padding(
                padding: EdgeInsets.only(left: 60.0),
                child: Icon(Icons.bookmark_border_outlined),
              )
            ],
          ),
        ),
        Text(
          bookDto.author,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _TrendingBooksSection extends StatelessWidget {
  const _TrendingBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Trendingbooks> trending = [
      Trendingbooks(Colors.blue, 'books 1'),
      Trendingbooks(Colors.grey, 'books 2'),
      Trendingbooks(Colors.orange, 'books 3'),
      Trendingbooks(Colors.purple, 'books 4'),
      Trendingbooks(Colors.green, 'books 5'),
      Trendingbooks(Colors.yellow, 'books 6'),
      Trendingbooks(Colors.red, 'books 7'),
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Trending Books',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Show All',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ],
          ),
          ListView.builder(
            itemCount: trending.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Trendingbooks(trending[index].color, trending[index].name);
            },
          ),
        ],
      ),
    );
  }
}
