import 'package:flutter/material.dart';
import 'package:notes2_app/models/note_model.dart';
import 'package:notes2_app/views/widgets/edit_note_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: EditNoteViewBody(
          note: note,
        ),
      ),
    );
  }
}
