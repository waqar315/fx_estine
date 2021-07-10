import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Post extends StatefulWidget {
  final imageUrl, title, content;

  const Post({Key key, this.imageUrl, this.title, this.content})
      : super(key: key);
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.imageUrl),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 2, 6, 2),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              Html(data: widget.content),

              // postContent(widget.content)
            ],
          ),
        ),
      ),
    );
  }
}
