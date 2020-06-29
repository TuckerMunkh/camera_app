import 'package:camreatest/Screens/APIList.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String appBarTitle;
  final ProductMax product;

  ListItem(this.product, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return ListItemState(this.product, this.appBarTitle);
  }
}

class ListItemState extends State<ListItem> {
  String appBarTitle;
  ProductMax product;

  ListItemState(this.product, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    product.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  product.category_name,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text(product.id.toString()),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        product.description,
        softWrap: true,
      ),
    );
    return MaterialApp(
        title: appBarTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
          ),
          body: ListView(
            children: [
              titleSection,
              Image.asset(
                'images/logov1.jpg',
                width: 240,
                height: 240,
                fit: BoxFit.contain,
              ),
              buttonSection,
              textSection,
            ],
          ),
        ));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
