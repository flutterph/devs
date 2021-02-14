import 'package:devs/core/datasource/local/devs_local_datasource.dart';
import 'package:devs/core/repositories/devs_repository.dart';
import 'package:devs/features/dashboard/dashboard_page.dart';
import 'package:devs/features/dashboard/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevsApp());
}

class DevsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DevsAppState();
  }
}

class _DevsAppState extends State<DevsApp> {
  IDevsLocalDataSource devsLocalDataSource;
  IDevsRepository devsRepository;

  @override
  void initState() {
    devsLocalDataSource = DevsLocalDataSource();
    devsRepository = DevsRepository(
      devsLocalDataSource,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardModel(devsRepository),
        ),
        Provider(
          create: (_) => devsLocalDataSource,
        ),
        Provider(
          create: (_) => devsRepository,
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
