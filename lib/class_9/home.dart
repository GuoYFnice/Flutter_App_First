import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
            onPressed: () {
              print('Menu button');
            },
          ),
          title: Text('Shrine'),
          actions: [
            IconButton(
                icon: Icon(Icons.search, semanticLabel: 'search'),
                onPressed: () {
                  print('Menu button');
                }),
            IconButton(
                icon: Icon(Icons.tune, semanticLabel: 'tune'),
                onPressed: () {
                  print('Menu button');
                })
          ],
        ),
        body: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(10)));
  }
}

List<Card> _buildGridCards(int count) {
  List<Card> cards = List.generate(
    count,
    (int index) => Card(
      elevation: 0.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/diamond.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title'),
                SizedBox(height: 8.0),
                Text('Secondary Text'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return cards;
}
