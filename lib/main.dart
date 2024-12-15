import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes2_app/models/note_model.dart';
import 'package:notes2_app/simble_block_observe.dart';
import 'package:notes2_app/views/notes_view.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
/*
The Bloc.observer is a static property in the Bloc class.
we set the Bloc.observer to an instance of SimpleBlockObserver,
 which will log all state changes and errors that occur in our Blocs.
  This can be a valuable tool for understanding the state management 
  behavior of your Flutter application.

*/
  Bloc.observer = SimpleBlockObserve();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>('KNotesBox');
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesView(),
      ),
    );
  }
}
