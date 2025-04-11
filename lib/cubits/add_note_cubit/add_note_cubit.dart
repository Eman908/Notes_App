import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/cubits/add_note_cubit/add_note_state.dart';
import 'package:todo/models/note_model.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xffBDB375);
  addNote(NoteModel note) async {
    note.color = color.toARGB32();
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModel>('notes_box');
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFaluier(errMessage: e.toString()));
    }
  }
}
