import 'package:flutter/material.dart'; 
import 'package:news_app/model/news_artical_model.dart'; 

class DetailedScreen extends StatefulWidget {
  final NewsArticle newsArticle;

  const DetailedScreen({Key? key, required this.newsArticle}) : super(key: key);

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed News'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.newsArticle.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            if (widget.newsArticle.urlToImage.isNotEmpty)
              Image.network(
                widget.newsArticle.urlToImage,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            Text(
              'Source: ${widget.newsArticle.sourceName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${widget.newsArticle.author}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Published At: ${widget.newsArticle.publishedAt}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${widget.newsArticle.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Content: ${widget.newsArticle.content}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your action here
              },
              child: Text('Read More'),
            ),
          ],
        ),
      ),
    );
  }
}
