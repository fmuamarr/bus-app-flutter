import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailNews extends StatelessWidget {
  final url;
  final title;
  final content;
  final publisedAt;
  final author;
  final urlToImage;

  DetailNews({
    this.url,
    this.title,
    this.content,
    this.publisedAt,
    this.author,
    this.urlToImage,
  });

  // const DetailNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$title",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "$publisedAt",
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 5),
                Text("$content"),
                const Divider(),
                Text("Author: $author"),
                Text("Sumber: $url")
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
