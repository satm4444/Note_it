import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_it/models/notes.dart';
import 'package:note_it/screens/detail_screen.dart';

class NoteList extends StatefulWidget {
  final List<Notes> _note;

  final Function _deleteTx;

  NoteList(this._note, this._deleteTx);
  DateTime dateTime;

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DateTime getDateTime(int i) {
    DateTime noteDate = DateTime.parse(widget._note[i].id);
    return noteDate;
  }

  @override
  Widget build(BuildContext context) {
    return widget._note.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Container(
                alignment: Alignment.center,
                height: 300,
                width: 300,
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(top: 140, left: 50),
                child: Image.asset(
                  "assets/images/nothing.png",
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: widget._note.length,
            itemBuilder: (ctx, i) {
              return Dismissible(
                key: ValueKey(widget._note[i].id),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  widget._deleteTx(widget._note[i].id);
                },
                background: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 10),
                    margin: EdgeInsets.symmetric(vertical: 3.5),
                    color: Colors.red,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 34,
                    )),
                child: InkWell(
                  onTap: () {
                    // selectedNote(context);
                    Navigator.pushNamed(ctx, DetailScreen.routeName,
                        arguments: {
                          "title": widget._note[i].title,
                          "des": widget._note[i].description
                        });
                  },
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(DateFormat.Hm().format(getDateTime(i))),
                      ),
                      title: Text(widget._note[i].title),
                      subtitle: Text(widget._note[i].description),
                    ),
                  ),
                ),
              );
            });
  }
}
