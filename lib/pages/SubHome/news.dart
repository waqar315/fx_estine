// import 'dart:html';

import 'package:firebase_app_web/pages/News/post.dart';
import 'package:firebase_app_web/pages/News/wp-post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class News extends StatefulWidget {
  News({Key key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            FutureBuilder(
              future: fetchWpPosts(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    // for solved *Flutter: RenderBox was not laid out* use Expanded
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map wppost = snapshot.data[index];

                          return PostTitle(
                            href: wppost["_links"]["wp:featuredmedia"][0]
                                ["href"],
                            title: wppost["title"]["rendered"],
                            desc: wppost["excerpt"]["rendered"],
                            content: wppost["content"]["rendered"],
                          );
                        }),
                  );
                }
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PostTitle extends StatefulWidget {
  final String href, title, desc, content;

  const PostTitle({Key key, this.href, this.title, this.desc, this.content})
      : super(key: key);

  @override
  _PostTitleState createState() => _PostTitleState();
}

class _PostTitleState extends State<PostTitle> {
  var imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Post(
                      imageUrl: imageUrl,
                      title: widget.title,
                      content: widget.content,
                    )));
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: fetchWpPostImageUrl(widget.href),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      imageUrl = snapshot.data["guid"]["rendered"];
                      return Container(
                          child:
                              Image.network(snapshot.data["guid"]["rendered"]));
                    }
                    return Center(
                        child: CircularProgressIndicator(color: Colors.white));
                  }),
              SizedBox(height: 16),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 8),
              Html(
                data: widget.desc,
              )
            ],
          )),
    );
  }
}
