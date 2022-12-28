import 'dart:developer';

import 'package:bookapp/Books.dart';
import 'package:bookapp/widgets/search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchTextField(),
            SizedBox(height: 20),
            _PopularBooksSection(),
          ],
        ),
      ),
    );
  }
}

class _PopularBooksSection extends StatelessWidget {
  const _PopularBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Popular',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              'Show All',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                height: double.maxFinite,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  //physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return item();
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget item() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Books(Colors.blue, 'Book1'),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Sub-Title',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Icon(Icons.access_alarm),
          ],
        ),
      ],
    );
  }
}

/*class _TrendingBooksSection extends StatelessWidget {
  const _TrendingBooksSection({Key? key}) : super(key: key);

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
              ),
            ),
            Text(
              'Show All',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                //physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return item();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

 /*Widget item() {
    return Row(
      children: [
        Column(
          children: [
            Books(Colors.red, 'BOOKS'),
            SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sub-Title',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Icon(Icons.star_border),
              ],
            )
          ],
        )
      ],
    );
  }*/
}*/
