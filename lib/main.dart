import 'package:devs/features/dashboard/dashboard_page.dart';
import 'package:devs/features/dashboard/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevsApp());
}

class DevsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Devs App by Flutter Philippines',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DashboardPage(),
      ),
    );
  }
}
