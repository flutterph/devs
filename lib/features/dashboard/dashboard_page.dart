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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.blue.shade50,
          expandedHeight: 400.0,
          floating: true,
          snap: true,
          flexibleSpace: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 10),
                child: Image.asset(
                  'assets/logos/logo.png',
                  height: 64,
                  alignment: Alignment.topLeft,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 50,
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
                      SizedBox(height: 50),
                      SearchBar(
                        onChanged: (String search) {
                          dashboardModel.search(search);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 1000,
          delegate: SliverChildListDelegate(
            [
              Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 32,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
