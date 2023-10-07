// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nott_a_student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';

Widget newsTypeButton(BuildContext context, String text) {
  return BlocBuilder<NewsTypeCubit, NewsTypeState>(
    buildWhen: (previous, current) {
      return previous.type != current.type;
    },
    builder: (context, state) {
      return GestureDetector(
        onTap: () {
          context.read<NewsTypeCubit>().onNewsTypeChanged(text);
        },
        child: Container(
          padding: const EdgeInsets.all(8.0), // Add padding
          decoration: BoxDecoration(
            color: context.read<NewsTypeCubit>().state.type == text
                ? Colors.blue
                : Colors.white,
            border: Border.all(
              color: Colors.black, // Border color
              width: 1.0, // Border width
            ),
          ), // Change color when clicked
          child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      );
    },
  );
}
