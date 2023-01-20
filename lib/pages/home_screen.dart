import 'dart:developer';

import 'package:bookapp/Services/Remoteservices.dart';
import '../models/Booksapp.dart';
import '../widgets/trendingbooks.dart';
import 'package:bookapp/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../widgets/Example.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            Iconmenu(),
            SizedBox(height: 20),
            _PopularBooksSection(),
            SizedBox(
              height: 20,
            ),
            _TrendingBooksSection(),
          ],
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
      children: [
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
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
        ),
      ],
    );
  }
}

class _PopularBooksSection extends StatefulWidget {
  _PopularBooksSection({Key? key}) : super(key: key);

  @override
  State<_PopularBooksSection> createState() => _PopularBooksSectionState();
}

class _PopularBooksSectionState extends State<_PopularBooksSection> {
  List<Book>? Bookstore = [];
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    Bookstore = (await RemoteService().getBooks()) as List<Book>?;
    if (Bookstore != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
      SizedBox(
        height: 10,
      ),
      Visibility(
          visible: isLoaded,
          // ignore: sort_child_properties_last
          child: SizedBox(
            height: 245,
            child: ListView.builder(
              itemCount: Bookstore?.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              //physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                            height: 220,
                            width: 150,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: (Bookstore![index].bookImage)),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            Bookstore![index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 60.0),
                            child: Icon(Icons.bookmark_border_outlined),
                          )
                        ],
                      ),
                      Text(
                        Bookstore![index].author,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          )),
    ]);
  }
}

class _TrendingBooksSection extends StatelessWidget {
  _TrendingBooksSection({Key? key}) : super(key: key);
  List<Trendingbooks> trending = [
    Trendingbooks(Colors.blue, 'books 1'),
    Trendingbooks(Colors.grey, 'books 2'),
    Trendingbooks(Colors.orange, 'books 3'),
    Trendingbooks(Colors.purple, 'books 4'),
    Trendingbooks(Colors.green, 'books 5'),
    Trendingbooks(Colors.yellow, 'books 6'),
    Trendingbooks(Colors.red, 'books 7'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Expanded(
            child: ListView.builder(
              itemCount: trending.length,
              shrinkWrap: true,
              //physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Trendingbooks(
                    trending[index].color, trending[index].name);
              },
            ),
          ),
        ),
      ],
    );
  }
}
