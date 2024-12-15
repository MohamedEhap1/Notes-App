import 'package:flutter/material.dart';
import 'package:notes2_app/constants.dart';
import 'package:notes2_app/models/note_model.dart';
import 'package:notes2_app/views/widgets/color_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;
  @override
  initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38 * 2,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: kColors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = kColors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    color: kColors[index],
                    isSelected: currentIndex == index,
                  ),
                ),
              );
            }));
  }
}
