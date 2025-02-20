import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_qoute/components/basic_app_bar.dart';
import 'package:text_qoute/constants/app_constant.dart';
import 'package:text_qoute/constants/theme_provider.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});
  @override
  GenerateScreenState createState() => GenerateScreenState();
}

class GenerateScreenState extends State<GenerateScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, dynamic>? _currentQuote;
  bool _isLoading = false;

  Future<void> fetchRandomQuote() async {
    setState(() {
      _isLoading = true;
    });

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('Text Quote')
          .get(); // Fix collection name
      if (querySnapshot.docs.isNotEmpty) {
        final randomIndex = Random().nextInt(querySnapshot.docs.length);
        final randomDoc = querySnapshot.docs[randomIndex];

        return setState(() {
          _currentQuote = randomDoc.data() as Map<String, dynamic>;
        });
      } else {
        setState(() {
          _currentQuote = {'text': 'No quotes found', 'author': '-'};
        });
      }
    } catch (e) {
      debugPrint("Error fetching quotes: $e");
      setState(() {
        _currentQuote = {'text': 'Error fetching quote', 'author': '-'};
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  @override
  void initState() {
    super.initState();
    fetchRandomQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: 'Quote Generator'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        Text(
                          _currentQuote?['text'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: QColors.primary,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "- ${_currentQuote?['author'] ?? 'Unknown'}",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            color: context.isDarkMode
                                ? QColors.light
                                : QColors.dark,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isLoading ? null : fetchRandomQuote,
                child: Text(
                  "Generate Quote",
                  style: TextStyle(
                      color: context.isDarkMode ? QColors.dark : QColors.light),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
