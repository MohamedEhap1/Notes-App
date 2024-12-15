import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes2_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes2_app/models/note_model.dart';
import 'package:notes2_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: notes,
            );
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                notes.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  notes.subTitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 18,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  notes.delete(); //as we extend from HiveObject in NoteMode l
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  size: 24,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                notes.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
