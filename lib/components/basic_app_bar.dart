import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_qoute/constants/app_constant.dart';
import 'package:text_qoute/constants/theme_cubit.dart';
import 'package:text_qoute/constants/theme_provider.dart';
import 'package:text_qoute/pages/home_screen.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const BasicAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          context.isDarkMode ? QColors.darkContainer : QColors.lightContainer,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            color: context.isDarkMode ? QColors.primary : QColors.dark),
      ),
      leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? Colors.white.withAlpha(3)
                    : Colors.transparent),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: context.isDarkMode ? QColors.light : QColors.dark,
            ),
          )),
      actions: [
        IconButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(context.isDarkMode
                    ? QColors.darkContainer
                    : QColors.lightContainer)),
            onPressed: () {
              final themeCubit = context.read<ThemeCubit>();
              themeCubit.updateTheme(themeCubit.state == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light);
            },
            icon: context.isDarkMode
                ? Icon(Icons.light_mode)
                : Icon(
                    Icons.dark_mode,
                    color: context.isDarkMode ? QColors.primary : QColors.dark,
                  ))
      ],
    );
  }
}
