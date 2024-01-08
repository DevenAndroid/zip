import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as htmlDom;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageScreeen(),
    );
  }
}

class ImageScreeen extends StatefulWidget {
  @override
  _ImageScreeenState createState() => _ImageScreeenState();
}

class _ImageScreeenState extends State<ImageScreeen> {
  TextEditingController _urlController = TextEditingController();
  String _imageUrl = "";

  void _fetchImage() async {
    String url = _urlController.text;

    if (url.isNotEmpty) {
      // Fetch HTML content of the webpage
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Parse HTML content to extract image URL
        final document = htmlParser.parse(response.body);
        final images = document.getElementsByTagName('img');

        if (images.isNotEmpty) {
          final imageUrl = images[8].attributes['src'];
          setState(() {
            _imageUrl = imageUrl!;
          });
        } else {
          setState(() {
            _imageUrl = "No image found on the webpage";
          });
        }
      } else {
        setState(() {
          _imageUrl = "Failed to fetch webpage content";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Website Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter Website URL',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchImage,
              child: Text('Fetch Image'),
            ),
            SizedBox(height: 16),
            _imageUrl.isNotEmpty
                ? Container(
                    child: CachedNetworkImage(
                    imageUrl: _imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ))
                : Text('No image to display'),
          ],
        ),
      ),
    );
  }
}
