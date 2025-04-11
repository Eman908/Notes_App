import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/widgets/custom_appbr.dart';
import 'package:todo/widgets/custome_text_field.dart';
import 'package:todo/widgets/edit_note_color.dart';

class EditNoteBody extends StatefulWidget {
  const EditNoteBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteBody> createState() => _EditNoteBodyState();
}

class _EditNoteBodyState extends State<EditNoteBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        spacing: 16,
        children: [
          CustomAppBar(
            title: 'Edit',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.content = content ?? widget.note.content;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          CustomTextField(
            initialValue: widget.note.title,
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          CustomTextField(
            initialValue: widget.note.content,
            onChanged: (value) {
              content = value;
            },
            hintText: widget.note.content,
            maxLines: 5,
          ),
          EditNoteColor(note: widget.note),
        ],
      ),
    );
  }
}
