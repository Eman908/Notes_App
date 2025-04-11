import 'package:flutter/material.dart';
import 'package:todo/models/note_model.dart';
import 'package:todo/widgets/color_list.dart';

class EditNoteColor extends StatefulWidget {
  const EditNoteColor({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColor> createState() => _EditNoteColorState();
}

late int currentIndex;

class _EditNoteColorState extends State<EditNoteColor> {
  @override
  void initState() {
    currentIndex = colorsList.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.note.color = colorsList[index].toARGB32();
              setState(() {});
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ColorItem(
                isActive: currentIndex == index,
                color: colorsList[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
