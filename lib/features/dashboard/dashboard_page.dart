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
  DashboardModel dashboardModel;
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
    dashboardModel = Provider.of<DashboardModel>(context);

    pages = [
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DevBoardModel(dashboardModel.getDevs()),
          ),
        ],
        child: DevboardPage(),
      ),
      // ChangeNotifierProvider(
      //   create: (_) => DevBoardModel(dashboardModel.getDevs()),
      //   child: DevboardPage(),
      // ),
      JobsPage(),
    ];

    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      if (dashboardModel.selectedPageIndex != pageController.page.floor()) {
        pageController.jumpToPage(
          dashboardModel.selectedPageIndex,
        );
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Stack(
          children: [
            Container(
              height: 400,
              color: Colors.blue.shade50,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 32,
                  left: 32,
                ),
                height: 64,
                child: Image.asset(
                  'assets/logos/logo.png',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 460,
                left: 32,
                right: 32,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1000,
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: pages,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 200,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainFilters(
                          selectedIndex: dashboardModel.selectedPageIndex,
                          onDevboardPressed: () =>
                              dashboardModel.setSelectedPageIndex(0),
                          onJobsPressed: () =>
                              dashboardModel.setSelectedPageIndex(1),
                        ),
                      ],
                    ),
                    SizedBox(height: 80),
                    SearchBar(
                      onChanged: (String search) {
                        dashboardModel.search(search);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
