import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vol_org/pages/admin_panel/admin_page.dart';
import 'package:vol_org/pages/common/common_page.dart';
import 'package:vol_org/pages/messages/messages_page.dart';
import 'package:vol_org/pages/operations/operations_page.dart';
import 'package:vol_org/styles/styles.dart';

import 'main.dart';

enum TabType { common, messages, operations, admin }

class AppShell extends ConsumerStatefulWidget {

  const AppShell({Key? key}) : super(key: key);

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell>
    with TickerProviderStateMixin {
  int selectedIndex = 0;

  final routeMap = {0: "common", 1: "messages", 2: "operations", 3: "admin"};

  TabController? tabController;
  var lastTabValue = TabType.common;
  List<TabType> tabList = [
    TabType.common,
    TabType.messages,
    TabType.operations,
    TabType.admin,
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        length: tabList.length,
        vsync: this,
        initialIndex: TabType.common.index);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: styles.backgroundDecoration,
        child: Scaffold(
          body: TabBarView(
              key: const Key("tabbar"),
              controller: tabController,
              children: tabList.map<Widget>((tab) {
                Widget content = const SizedBox.shrink();
                switch (tab) {
                  case TabType.common:
                    content = CommonPage(key: const Key("common"));
                    break;
                  case TabType.messages:
                    content = MessagesPage(key: const Key("messages"));
                    break;
                  case TabType.operations:
                    content = OperationsPage(key: const Key("operations"));
                    break;
                  case TabType.admin:
                    content = AdminPanelPage(key: const Key("admin"));
                    break;
                }
                return content;
              }).toList()),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              color: styles.themeColors.brand.withOpacity(0.6),
              height: kBottomNavigationBarHeight,
              child: TabBar(
                labelStyle: styles.mainTextTheme.labelSmall?.copyWith(fontSize: 9),
                controller: tabController,
                indicatorColor: styles.themeColors.text,
                tabs: tabList.map<Widget>((tab) {
                  Widget? content;
                  switch (tab) {
                    case TabType.common:
                      content =
                      const Tab(icon: Icon(Icons.home), child: Text("Главная"));
                      break;
                    case TabType.messages:
                      content =
                      const Tab(icon: Icon(Icons.mail), child: Text("Сообщения"));
                      break;
                    case TabType.operations:
                      content =
                      const Tab(icon: Icon(Icons.search), child: Text("Операции"));
                      break;
                    case TabType.admin:
                      content = const Tab(icon: Icon(Icons.security),
                          child: Text("Админ"));
                      break;
                  }
                  if (content == null) {
                    return const SizedBox.shrink();
                  }
                  return content;
                }).toList(),),
            ),
          ),
        )
      /*BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              if(routeMap[index] != null) {
                context.go("/${routeMap[index] ?? 'common'}");
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.security),
              label: 'Administration',
            ),
          ],
        ),*/
    );
  }
}
