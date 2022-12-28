import 'package:bookapp/home_screen.dart';
import 'package:flutter/material.dart';
import 'Books.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*List<Books> bookinfo = [
    Books(Colors.red, 'book1'),
    Books(Colors.blue, 'book2'),
    Books(Colors.green, 'book2'),
    Books(Colors.purple, 'book2'),
    Books(Colors.yellow, 'book2'),
  ];*/

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      //home: HomeScreenCopy(bookinfo: bookinfo) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/*class HomeScreenCopy extends StatelessWidget {
  const HomeScreenCopy({
    Key? key,
    required this.bookinfo,
  }) : super(key: key);

  final List<Books> bookinfo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          const TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search For Books...',
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'POPULAR NOW',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Show All',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
          //for(i=1,i>bookinfo.length,i++);
          SizedBox(
            width: 200,
            child: ListView.builder(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20.0),
              itemCount: bookinfo.length,
              itemBuilder: (BuildContext context, index) {
                return Books(bookinfo[index].color, bookinfo[index].name);
              },
            ),
          ),
        ]),
      )),
    );
  }
}*/
