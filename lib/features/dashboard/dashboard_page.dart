import 'package:devs/core/repositories/devs_repository.dart';
import 'package:devs/core/widgets/components/main_filters.dart';
import 'package:devs/core/widgets/components/search_bar.dart';
import 'package:devs/features/dashboard/dashboard_model.dart';
import 'package:devs/features/devboard/devboard_model.dart';
import 'package:devs/features/devboard/devboard_page.dart';
import 'package:devs/features/jobs/jobs_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  PageController pageController;
  DashboardModel dashboard;
  List<Widget> pages;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dashboard = Provider.of<DashboardModel>(context);
    IDevsRepository devsRepository = Provider.of<IDevsRepository>(
      context,
      listen: false,
    );

    pages = [
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DevBoardModel(devsRepository),
          ),
        ],
        child: DevboardPage(),
      ),
      JobsPage(),
    ];

    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (dashboard.selectedPageIndex != pageController.page.floor()) {
        pageController.jumpToPage(
          dashboard.selectedPageIndex,
        );
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          backgroundColor: Colors.blue.shade50,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  left: 5,
                ),
                height: 50,
                child: Image.asset(
                  'assets/logos/logo.png',
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  left: 5,
                ),
                height: 50,
                child: SearchBar(
                  onChanged: (String search) {
                    dashboard.searchDevs(search);
                  },
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                  left: 5,
                ),
                height: 75,
                child: MainFilters(
                            selectedIndex: dashboard.selectedPageIndex,
                            onDevboardPressed: () =>
                                dashboard.setSelectedPageIndex(0),
                            onJobsPressed: () =>
                                dashboard.setSelectedPageIndex(1),
                          ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 5,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 32,
                right: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: pages,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
