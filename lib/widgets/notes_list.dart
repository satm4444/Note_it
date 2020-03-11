import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_it/models/notes.dart';
import 'package:note_it/screens/detail_screen.dart';

class NoteList extends StatelessWidget {
  final List<Notes> _note;

  final Function _deleteTx;

  NoteList(this._note, this._deleteTx);

  // void selectedNote(BuildContext ctx) {
  //   Navigator.pushNamed(
  //     ctx,
  //     DetailScreen.routeName,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm').format(now);
    return _note.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Container(
                height: 300,
                width: 300,
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(top: 140, left: 50),
                child: Image.asset(
                  "assets/images/nothing.png",
                  fit: BoxFit.contain,
                ),
              );
            },
          )
        : ListView.builder(
            itemCount: _note.length,
            itemBuilder: (ctx, i) {
              return Dismissible(
                key: ValueKey(_note[i].toString()),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _deleteTx(_note[i].id);
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
                          "title": _note[i].title,
                          "des": _note[i].description
                        });
                  },
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Text(formattedDate),
                      ),
                      title: Text(_note[i].title),
                      subtitle: Text(_note[i].description),
                    ),
                  ),
                ),
              );
            });
  }
}
