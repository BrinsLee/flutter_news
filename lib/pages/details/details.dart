import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String url;

  @override
  _DetailPageState createState() => _DetailPageState();

  DetailPage({Key key, this.title, this.url}) : super(key: key);
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aaa")),
      body: Container(
        child: Text('data: ${widget.title} , url: ${widget.url}'),
      ),
    );
  }
}
