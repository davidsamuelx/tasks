


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AddNewNotesScreen extends StatefulWidget {
   AddNewNotesScreen({super.key});

  @override
  State<AddNewNotesScreen> createState() => _AddNewNotesScreenState();
}

class _AddNewNotesScreenState extends State<AddNewNotesScreen> {
   final noteContainer = TextEditingController();

   final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: noteContainer,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                onPressed: () => addNote(),
                child: Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }

  addNote(){
    String note = noteContainer.text;


    String currentMillis = DateTime.now().millisecondsSinceEpoch.toString();

    //map String and dynamic
    Map<String, dynamic> data = {
      "id" : currentMillis,
      "note": note
    };

    firestore.collection("notes").doc(data["id"]).set(data);

    Navigator.pop(context);
  }
}
