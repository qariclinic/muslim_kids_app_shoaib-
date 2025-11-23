import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// آپ کے تمام صفحات (Screens)
import 'screens/home_screen.dart'; 
// import 'screens/worship/wudu_screen.dart'; // مستقبل کے لیے

void main() {
  runApp(const MuslimKidsApp());
}

class MuslimKidsApp extends StatelessWidget {
  const MuslimKidsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Muslim Kids App - شعیب',
      debugShowCheckedModeBanner: false,
      
      // تھیم: مکس کلر تھیم سیٹ کریں جو آنکھوں کو بھا دے
      theme: ThemeData(
        primaryColor: const Color(0xFF457b9d), // ایک اہم نیلا رنگ
        hintColor: const Color(0xFFe63946), // ایک سرخ لہجے کا رنگ
        scaffoldBackgroundColor: const Color(0xFFf1faee), // ہلکا پس منظر
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1d3557), // گہرا نیلا
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontFamily: 'Jameel Noori Nastaleeq', fontSize: 24), // اردو فانٹ
          bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 16),
        ),
        useMaterial3: true,
      ),

      // لوکلائزیشن (بنیادی)
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ur', ''), // Urdu
        Locale('ar', ''), // Arabic
      ],
      localizationsDelegates: const [
        // اپنے حسب ضرورت ڈیلیکیٹس یہاں آئیں گے (مثلاً AppLocalizations.delegate)
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        // اگر ڈیوائس کی زبان سپورٹ نہ ہو تو اردو کو ڈیفالٹ رکھیں
        return const Locale('ur', '');
      },

      home: const HomeScreen(), // ایپ کا پہلا صفحہ
    );
  }
}
