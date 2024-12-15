import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2_app/constants.dart';
import 'package:notes2_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes2_app/views/widgets/add_note_buttom_sheet.dart';
import 'package:notes2_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.black,
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled:
                    true, //let bottom sheet expanded with keyboard
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return const AddNoteButtonSheet();
                });
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        body: const NotesViewBody(),
      ),
    );
  }
}
