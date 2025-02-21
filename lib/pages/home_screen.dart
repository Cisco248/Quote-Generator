import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_qoute/constants/app_constant.dart';
import 'package:text_qoute/constants/theme_cubit.dart';
import 'package:text_qoute/constants/theme_provider.dart';
import 'package:text_qoute/pages/add_data.dart';
import 'package:text_qoute/pages/generate_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> recommendedQuotes = [];
  List<Map<String, dynamic>> popularSearches = [];
  List<Map<String, dynamic>> latestQuotes = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAllSections();
  }

  Future<void> fetchAllSections() async {
    setState(() => isLoading = true);
    await Future.wait([
      fetchQuotes("Recommended For You"),
      fetchQuotes("Popular Searches"),
      fetchQuotes("Latest Quotes"),
    ]);
    setState(() => isLoading = false);
  }

  Future<void> fetchQuotes(String collectionName) async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(collectionName).get();

      List<Map<String, dynamic>> quotes = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      setState(() {
        if (collectionName == "Recommended For You") {
          recommendedQuotes = quotes;
        } else if (collectionName == "Popular Searches") {
          popularSearches = quotes;
        } else if (collectionName == "Latest Quotes") {
          latestQuotes = quotes;
        }
      });
    } catch (e) {
      debugPrint("Error fetching $collectionName: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            context.isDarkMode ? QColors.darkContainer : QColors.lightContainer,
        leading: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Image(
              image: AssetImage('assets/vectors/logo.png'),
            )),
        title: Text(
          "Quoter",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: context.isDarkMode ? QColors.light : QColors.dark),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {
                    final themeCubit = context.read<ThemeCubit>();
                    themeCubit.updateTheme(themeCubit.state == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light);
                  },
                  icon: context.isDarkMode
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode)))
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
              color: QColors.primary,
              backgroundColor:
                  context.isDarkMode ? QColors.dark : QColors.light,
            ))
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildSection("Recommended For You", recommendedQuotes),
                  _buildSection("Popular Searches", popularSearches),
                  _buildSection("Latest Quotes", latestQuotes),
                ],
              ),
            ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber[100],
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GenerateScreen()));
            },
            child: const Icon(Icons.graphic_eq_rounded,
                color: Colors.amber, size: 32),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            backgroundColor: Colors.amber[100],
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddUser()));
            },
            child: const Icon(Icons.add_circle, color: Colors.amber, size: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, dynamic>> quotes) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: context.isDarkMode ? Colors.white : Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            child: quotes.isEmpty
                ? Center(child: Text("No data available"))
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: quotes.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: context.isDarkMode
                                ? QColors.darkContainer
                                : QColors.lightContainer,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                quotes[index]['text'] ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: QColors.primary),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "- ${quotes[index]['author'] ?? 'Unknown'}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11,
                                    fontStyle: FontStyle.italic,
                                    color: context.isDarkMode
                                        ? QColors.light
                                        : QColors.dark),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
