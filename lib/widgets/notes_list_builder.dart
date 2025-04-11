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
              final note = notesList[index];
              return Dismissible(
                key: ValueKey(note.key), // Ensure each item has a unique key
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  note.delete(); // delete from Hive
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Note Deleted",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: NotesCard(noteModel: note),
              );
            },
          ),
        );
      },
    );
  }
}
