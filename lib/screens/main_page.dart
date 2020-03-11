import 'package:flutter/material.dart';
import 'package:note_it/models/notes.dart';
import 'package:note_it/widgets/new_note.dart';
import 'package:note_it/widgets/notes_list.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Notes> _userNotes = [];
  void _addNote(String txTitle, String txDes) {
    Notes newTx = new Notes(
      id: DateTime.now().toString(),
      description: txDes,
      title: txTitle,
    );

    setState(() {
      _userNotes.add(newTx);
    });
  }

  void showBtSheet(BuildContext ctx) {
    showModalBottomSheet(
        backgroundColor: Colors.green,
        context: ctx,
        builder: (bCtx) {
          return NewNote(_addNote);
        });
  }

  _deleteTransaction(String id) {
    setState(() {
      _userNotes.removeWhere((tx) {
        return tx.id == id;
      });
      //  _userNotes.remove(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageBody = Container(
      child: NoteList(_userNotes, _deleteTransaction),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              iconSize: 24,
              onPressed: () {
                showBtSheet(context);
              })
        ],
        title: Text(
          'NoteIt',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: pageBody,
    );
  }
}
