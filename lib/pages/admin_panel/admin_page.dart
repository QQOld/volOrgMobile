import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/pages/admin_panel/admin_panel.dart';
import 'package:vol_org/widgets/app_bar_back_button.dart';

class AdminPanelPage extends ConsumerStatefulWidget {
  const AdminPanelPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _AdminPanelPageState();
}

class _AdminPanelPageState extends ConsumerState<AdminPanelPage> {
  final GlobalKey<NavigatorState> commonNavigatorKey =
      GlobalKey<NavigatorState>();

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      '/': (context) => AdminPanel(),
      '/1': (context) => ElevatedButton(onPressed: () {
        Navigator.of(context).pushNamed('/');
      }, child: Text("go")),
    };
  }

  @override
  Widget build(BuildContext context) {
    var routeBuilders = _routeBuilders(context);

    return Scaffold(
      appBar: AppBarBack(title: "Администрирование", context: context,),
      body: Navigator(
        key: commonNavigatorKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute(
              builder: (context) =>
                  routeBuilders[routeSettings.name]!(context));
        },
        onPopPage: (route, result) {
          return true;
        },
      ),
    );
  }
}
