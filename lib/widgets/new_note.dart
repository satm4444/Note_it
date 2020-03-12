import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  final Function addTx;
  NewNote(this.addTx);
  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final titleController = new TextEditingController();
  final desController = new TextEditingController();

  void addToNote() {
    String title = titleController.text;
    String des = desController.text;
    if (title.isEmpty || des.isEmpty) {
      return;
    }
    widget.addTx(title, des);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10,
            top: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "Wanna add title to your note ?",
                ),
                controller: titleController,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                maxLines: 1,
                decoration: InputDecoration(labelText: "Let's write"),
                controller: desController,
              ),
              SizedBox(
                height: 30,
              ),
              RaisedButton(
                splashColor: Colors.greenAccent,
                elevation: 10,
                color: Colors.green,
                child: Text(
                  "Add Note",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white),
                ),
                onPressed: () {
                  addToNote();
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
