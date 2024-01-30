import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ImageScreeen(),
    );
  }
}

class ImageScreeen extends StatefulWidget {
  const ImageScreeen({super.key});

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
        title: const Text('Fetch Website Image'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'Enter Website URL',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchImage,
              child: const Text('Fetch Image'),
            ),
            const SizedBox(height: 16),
            _imageUrl.isNotEmpty
                ? Container(
                    child: CachedNetworkImage(
                    imageUrl: _imageUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ))
                : const Text('No image to display'),
          ],
        ),
      ),
    );
  }
}
