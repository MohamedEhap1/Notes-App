import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2_app/constants.dart';
import 'package:notes2_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes2_app/models/note_model.dart';
import 'package:notes2_app/views/widgets/color_item.dart';
import 'package:notes2_app/views/widgets/colors_list_view.dart';
import 'package:notes2_app/views/widgets/custom_app_bar.dart';
import 'package:notes2_app/views/widgets/custom_text_field.dart';
import 'package:notes2_app/views/widgets/edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save(); //as extends from HiveObject
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();

                Navigator.pop(context);
              },
              title: 'Edit Note',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.note.title),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hintText: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            EditNoteColorList(
              note: widget.note,
            ),
          ],
        ),
      ),
    );
  }
}
