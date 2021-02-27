import 'package:devs/core/datasource/local/devs_local_datasource.dart';
import 'package:devs/core/datasource/memory/devs_memory_datasource.dart';
import 'package:devs/core/repositories/devs_repository.dart';
import 'package:devs/features/dashboard/dashboard_model.dart';
import 'package:devs/features/dashboard/dashboard_page.dart';
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
  DevsLocalDataSource devsLocalDataSource;
  DevsMemoryDataSource devsMemoryDataSource;
  IDevsRepository devsRepository;

  @override
  void initState() {
    devsLocalDataSource = DevsLocalDataSource();
    devsMemoryDataSource = DevsMemoryDataSource();
    devsRepository = DevsRepository(
      devsLocalDataSource, devsMemoryDataSource
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardModel(devsRepository),
        ),
        // No need to expose the sources
        // Provider(
        //   create: (_) => devsLocalDataSource,
        // ),
        // Provider(
        //   create: (_) => devsRepository,
        // ),
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
