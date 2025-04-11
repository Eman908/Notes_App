import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/views/edit_note_view.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(note: noteModel);
            },
          ),
        );
      },
      child: Card(
        elevation: 0,
        color: Color(noteModel.color),

        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            bottom: 24,
            right: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  noteModel.title,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),

                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    noteModel.content,
                    style: TextStyle(
                      color: Colors.black.withAlpha(200),
                      fontSize: 18,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    noteModel.delete();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Note Deleted",
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(milliseconds: 500),
                      ),
                    );
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),
              Text(
                noteModel.date,
                style: TextStyle(
                  color: Colors.black.withAlpha(150),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
