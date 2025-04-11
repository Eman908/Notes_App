import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/widgets/edit_note_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteBody(note: note));
  }
}
