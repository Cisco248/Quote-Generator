# Random "Famous Quote" Generator App

---

Table of Contents

        1. Introduction
        2. Project Overview
        3. Application Features
        4. Project Structure
        5. Widget Hierarchy Diagram
        6. Code Explanation
        7. User Interface (UI)
        8. Lessons Learned
        9. DartDoc Documentation
        10. GitHub Repository
        11. References

---

## 1. Introduction

This document provides a comprehensive explanation of the **Random "Famous Quote" Generator** Flutter application, developed as part of the CCS3351 Mobile Application Development final project. The application displays random quotes from different categories and provides additional information about the authors.

---

## 2. Project Overview

The goal of this project is to create a Flutter application that fetches and displays random quotes from a locally stored list. The application consists of two main screens:

### 1. Quote Display Screen

Shows a random quote and its author with a category selection dropdown.

### 2. Quote Details Screen

Displays detailed information about the quote, the author, and related images.
Technologies Used
• Flutter (Dart)
• State Management (Provider or setState)
• Navigation & Routing (Navigator)
• UI Components (DropdownButton, ListView, ElevatedButton, Image Widget)

---

## 3. Application Features

    ✔ Displays random quotes on app startup.
    ✔ Allows users to select different categories of quotes.
    ✔ Users can fetch a new quote by clicking a button.
    ✔ Clicking on a quote navigates to a detailed view with more information about the author.
    ✔ Smooth screen navigation between the two pages.

---

## 4. Project Structure

        │random_quote_app|
        |
        │── /lib
        | |
        │ │── main.dart
        | |
        │ │── /pages
        | | │── /start_page
        | |   │── splash.dart
        │ │ │── home_screen.dart
        │ │ │── generate_page.dart
        │ │ │── add_data.dart
        | |
        │ │── /constants
        │ │ │── app_constant.dart
        │ │ │── app_theme.dart
        │ │ │── theme_cubit.dart
        │ │ │── theme_provider.dart
        | |
        │ │── /domain
        │ │ │── firebase_option.dart
        | |
        │ │── /components
        │ │ │── basic_app_bar.dart
        |
        │── /assets
        │ │── /images
        │ | │── 1.png
        │ | │── 2.png
        │ | │── 3.png
        │ | │── 4.png
        │ │
        | │── /vectors
        │ | │── logo.png
        │ | │── Logo.svg
        │ | │── logo2.png
        │ | │── text.png
        |
        │── pubspec.yaml

---

## 5. Widget Hierarchy Diagram

(Insert a diagram here showing the relationship between widgets. Example below.)

        MaterialApp
        │── HomeScreen (StatefulWidget)
        │ │── DropdownButton (Category Selection)
        │ │── QuoteCard (Displays quote & author)
        │ │── ElevatedButton (Fetch new quote)
        |
        │── DetailsScreen (StatefulWidget)
        │ │── Image (Author photo)
        │ │── Text (Quote & Author details)
        │ │── Back Button
        (Provide a graphical diagram as well.)

---

## 6. Code Explanation

**Main.dart**

```C++
        // This file initializes the app and sets up the navigation between screens.
        void main() {
            runApp(const MyApp());
        }
```

**home_screen.dart**

- Displays a random quote when the app starts.
- Allows users to select a category using a dropdown.
- Fetches a new quote when a button is pressed.
- Navigates to DetailsScreen when a quote is clicked.

```C++
    // Apptheme Selection Button
    IconButton(
        onPressed: () {
            final themeCubit = context.read<ThemeCubit>();
            themeCubit.updateTheme(themeCubit.state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
            },
            icon: context.isDarkMode ? Icon(Icons.light_mode : Icon(Icons.dark_mode))),
```

**generate_page.dart**

- Shows author details and an image.
- Displays extra notes about the quote.

```C++
    Future<void> fetchRandomQuote() async {
        setState(() {
        _isLoading = true;
        });

        try {
        QuerySnapshot querySnapshot =
            await _firestore.collection('Text Quote').get();
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
```

---

## 7. User Interface (UI)

Figma Prototype Link

    (Insert your Figma design link here if applicable.)

Screenshots

    (Insert screenshots of your app here.)

### 1. Home Screen

- Displays a random quote
- Allows category selection
- Button to fetch new quotes

### 2. Details Screen

- Displays quote details
- Shows author image and extra notes

---

## 8. Lessons Learned

**During this project, I learned:**

- How to structure a Flutter application efficiently.
- The importance of state management and UI responsiveness.
- How to implement navigation between screens in Flutter.
- How to use DartDoc for documentation.
- Best practices for writing maintainable and readable code.

---

## 9. DartDoc Documentation

To generate documentation, run:

    dart doc

(Attach a sample DartDoc output or link to your docs folder.)

---

## 10. GitHub Repository

    The complete, commented, and tested code is available on GitHub.
    🔗 GitHub Repo Link: [Insert your repository link here]

---

## 11. References

- Flutter Official Documentation: <https://flutter.dev/docs>
- Dart Language Guide: <https://dart.dev/guides>
- Quote API (if used): [Insert API link]
