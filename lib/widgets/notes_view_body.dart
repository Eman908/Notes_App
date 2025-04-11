import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/notes_cubit/notes_cubit.dart';
import 'package:todo/widgets/custom_appbr.dart';
import 'package:todo/widgets/notes_list_builder.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 24, left: 24, top: 40),
      child: Column(
        children: [
          CustomAppBar(title: 'Notes'),
          Expanded(child: NotesListBuilder()),
        ],
      ),
    );
  }
}
