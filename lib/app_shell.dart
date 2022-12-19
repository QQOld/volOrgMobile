import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vol_org/styles/styles.dart';

class AppShell extends ConsumerStatefulWidget {
  final Widget child;

  const AppShell({Key? key, required this.child}) : super(key: key);

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: styles.themeColors.onBrandText,
        backgroundColor: styles.themeColors.brand,
        actionsIconTheme:
        IconThemeData(color: styles.themeColors.onBrandText),
        iconTheme: IconThemeData(color: styles.themeColors.onBrandText),
        titleTextStyle: Theme
            .of(context)
            .textTheme
            .titleLarge
            ?.copyWith(color: styles.themeColors.onBrandText),
        title: Row(crossAxisAlignment: CrossAxisAlignment.end, children: const [
          Expanded(child: Text("Волонтёры33")),
        ]),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: widget.child,),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
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
      ),
    );
  }
}