import 'package:flutter/material.dart';

class Trendingbooks extends StatelessWidget {
  final Color color;
  final String name;
  Trendingbooks(this.color, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 100,
              width: 80,
              // margin: EdgeInsets.only(bottom: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0), color: color),
              child: Text(name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 3,
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
                Icon(Icons.star_border)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110.0),
            child: SizedBox(
                height: 75,
                child: Center(child: Icon(Icons.bookmark_border_outlined))),
          )
        ],
      ),
    );
  }
}
/*ListTile(
      leading: Container(
        height: 100,
        width: 100,
        //margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: color),
        child: Text(name),
      ),
      title: Text(
        'Title',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sub-Title',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Icon(Icons.star_border)
        ],
      ),
      trailing: Icon(Icons.bookmark),
    );*/