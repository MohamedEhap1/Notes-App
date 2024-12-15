import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes2_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes2_app/views/widgets/add_note_form.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            debugPrint('Failed ${state.errorMessage}');
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
              //it make the widgets are disabled untill be false
              //help for errors accures by user like while fetch and sending data
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const SingleChildScrollView(child: AddNoteForm()),
              ));
        },
      ),
    );
  }
}
