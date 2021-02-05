import 'package:devs/features/dashboard/dashboard_model.dart';
import 'package:devs/features/devboard/devboard_page.dart';
import 'package:devs/features/jobs/jobs_page.dart';
import 'package:devs/widgets/components/main_filters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  PageController pageController;
  DashboardModel dashboard;
  List<Widget> pages = [
    DevboardPage(),
    JobsPage(),
  ];

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
      body: Column(
        children: [
          MainFilters(
            selectedIndex: dashboard.selectedPageIndex,
            onDevboardPressed: () => dashboard.setSelectedPageIndex(0),
            onJobsPressed: () => dashboard.setSelectedPageIndex(1),
          ),
          Container(
            height: 800,
            child: PageView(
              controller: pageController,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
