import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo/cubits/notes_cubit/notes_state.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/widgets/notes_card.dart';

class NotesListBuilder extends StatelessWidget {
  const NotesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notesList = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              return NotesCard(noteModel: notesList[index]);
            },
          ),
        );
      },
    );
  }
}
