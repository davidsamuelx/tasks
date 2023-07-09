import 'package:flutter/material.dart';
import 'blog.dart';

class AddNewBlogScreen extends StatelessWidget {
  AddNewBlogScreen({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Blog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: bodyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Body",
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ImageUrl",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  String title = titleController.text;
                  String body = bodyController.text;
                  String imageUrl = imageController.text.isEmpty
                      ? "https://cdn.eso.org/images/screen/eso1907a.jpg"
                      : imageController.text;

                  Blog blog =
                  Blog(title: title, body: body, imageUrl: imageUrl);

                  Navigator.pop(context, blog);
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}