
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tasks/notes/add_new_note_screen.dart';

import 'edit_note_screen.dart';

class NotesScreen extends StatefulWidget {
  NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final List<Map<String, dynamic>> notes = [];

  final firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getNotesFromFirebaseFireStore();
  }

  void getNotesFromFirebaseFireStore(){
    firestore.collection("notes").get()
        .then((value){
          notes.clear();
          for (var document in value.docs){
            final note = document.data();
            notes.add(note);
          }
          setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B1B1B),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1B1B),
        title: Text(
          "Notes",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5D98EF),
        onPressed: () {
          navigateToNewNoteScreen();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return noteItem(index);
        },
      ),
    );
  }


  Widget noteItem(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF222222),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(15, 10, 5, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              notes[index]['note'],
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              navigateToEditNoteScreen(index);
            },
            icon: Icon(
              Icons.edit_note_rounded,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {
              deleteNote(index);
            },
            icon: Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }


void navigateToNewNoteScreen(){
  Navigator.push(
      context,
      MaterialPageRoute(
      builder: (BuildContext contect) => AddNewNotesScreen(),
  ),
  ).then((value) {
    getNotesFromFirebaseFireStore();
    // if (value == null){
    //   return;
    // }
    // notes.add(value);
    // setState(() {});
   });
  }


  void navigateToEditNoteScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditNoteScreen(
          note: notes[index]['note'],
          id: notes[index]['id'],
        ),
      ),
    ).then((value) {
      getNotesFromFirebaseFireStore();
    });
  }

  deleteNote(int index) async {
    await firestore.collection("notes").doc(notes[index]['id']).delete();
    notes.removeAt(index);
    setState(() {});
  }

}

