import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_qoute/components/basic_app_bar.dart';
import 'package:text_qoute/constants/app_constant.dart';
import 'package:text_qoute/constants/theme_provider.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  AddUserState createState() => AddUserState();
}

class AddUserState extends State<AddUser> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  Future<void> addUser() async {
    String text = _textController.text.trim();
    String author = _authorController.text.trim();

    if (text.isEmpty || author.isEmpty) {
      debugPrint("All fields are required!");
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('Text Quote')
          .add({'text': text, 'author': author});
      debugPrint("User Added");
      _textController.clear();
      _authorController.clear();
    } catch (error) {
      debugPrint("Failed to Add Text: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Add to Storage'),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: QColors.primary)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: QColors.primary,
                            width: 2),
                      ),
                      hintText: 'Text Quote',
                      hintStyle: TextStyle(
                          color: context.isDarkMode
                              ? QColors.light
                              : QColors.dark),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: _authorController,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: QColors.primary)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: QColors.primary),
                        ),
                        hintText: 'Author',
                        hintStyle: TextStyle(
                          color:
                              context.isDarkMode ? QColors.light : QColors.dark,
                        )),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(QColors.primary),
                      shadowColor: WidgetStateProperty.all(Colors.transparent),
                      fixedSize: WidgetStateProperty.all(Size(100, 40))),
                  onPressed: addUser,
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            context.isDarkMode ? QColors.light : QColors.dark),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _authorController.dispose();
    super.dispose();
  }
}
