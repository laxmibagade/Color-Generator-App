import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ColorGeneratorApp());
}

class ColorGeneratorApp extends StatelessWidget {
  const ColorGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Generator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const ColorGeneratorScreen(),
    );
  }
}

class ColorGeneratorScreen extends StatefulWidget {
  const ColorGeneratorScreen({super.key});

  @override
  State<ColorGeneratorScreen> createState() => _ColorGeneratorScreenState();
}

class _ColorGeneratorScreenState extends State<ColorGeneratorScreen> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  final RandomColor _randomColor = RandomColor();

  void _generateColors() {
    setState(() {
      backgroundColor = _randomColor.randomColor();
      textColor = _randomColor.randomColor(
        colorBrightness: ColorBrightness.primary,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          '🎨 Color Generator',
          style: GoogleFonts.pacifico(
            color: backgroundColor, fontSize: 23, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tap below to refresh colors!',
              style: GoogleFonts.lobster(
                fontSize: 28,
                color: textColor,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _generateColors,
              style: ElevatedButton.styleFrom(
                backgroundColor: textColor,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                '🎲 Generate',
                style: TextStyle(
                  fontSize: 20,
                  color: backgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
