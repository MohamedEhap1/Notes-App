import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2_app/constants.dart';
import 'package:notes2_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes2_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes2_app/views/widgets/color_item.dart';

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: kColors[index],
                  isSelected: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
