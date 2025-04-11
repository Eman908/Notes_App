sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}

final class AddNoteLoading extends AddNoteState {}

final class AddNoteSuccess extends AddNoteState {}

final class AddNoteFaluier extends AddNoteState {
  final String errMessage;
  AddNoteFaluier({required this.errMessage});
}
