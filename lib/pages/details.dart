import 'package:flutter/material.dart';

class Detailspage extends StatelessWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 163, 223, 165),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 450,
              width: 370,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child:
                              Center(child: (Icon(Icons.arrow_back_ios_new)))),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child:
                            Center(child: Icon(Icons.bookmark_border_outlined)),
                      ),
                    ],
                  ),
                ),
                Center(child: Text('Little fires everywhere')),
                SizedBox(
                  height: 200,
                ),
                Text(
                  'Little fires Everywhere',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'By Chioma Godwin',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 243, 195, 50),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '\$25.00',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Little Fires Everything explores the weight of secrets, the nature of art and identity, and  the ferocious pull of motherhood'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 221, 230, 212),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('QTY'), Text('-'), Text('2'), Text('+')],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.green.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                        child: Text(
                      'But Now',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
