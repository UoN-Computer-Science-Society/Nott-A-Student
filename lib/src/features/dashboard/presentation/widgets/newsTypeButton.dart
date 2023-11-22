// ignore_for_file: camel_case_types

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Nott_A_Student/src/features/dashboard/presentation/cubit/news_type_cubit.dart';

Widget newsTypeButton(GlobalKey key, BuildContext context, String text) {
  return BlocBuilder<NewsTypeCubit, NewsTypeState>(
    buildWhen: (previous, current) {
      return previous.type != current.type;
    },
    builder: (context, state) {
      return GestureDetector(
        key: key,
        onTap: () {
          context.read<NewsTypeCubit>().setState(text);
          context.read<NewsTypeCubit>().onNewsTypeChanged(text);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8), // Add padding
          constraints: const BoxConstraints(minWidth: 65),
          decoration: BoxDecoration(
              color: context.read<NewsTypeCubit>().state.type == text
                  ? const Color(0x33005697)
                  : Colors.white,
              border: Border.all(
                color: Colors.black, // Border color
                width: 0.4, // Border width
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(2))), // Change color when clicked
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16),
            ),
          ),
        ),
      );
    },
  );
}
