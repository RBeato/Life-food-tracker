import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'UI/settings_page/settings.dart';
import 'UI/stats/stats_page.dart';
import 'UI/today_page/today_page.dart';

final tabIndexProvider = StateProvider.autoDispose<int>((ref) => 0);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with AutomaticKeepAliveClientMixin {
  late DateTime current;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    int tabIndex = ref.watch(tabIndexProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          ref.read(tabIndexProvider.notifier).state = index;
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Today',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.calendar_view_month_outlined),
          //   label: 'Calendar',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: WillPopScope(
              onWillPop: () => popped(), child: _getBody(tabIndex))),
    );
  }

  Future<bool> popped() {
    DateTime now = DateTime.now();
    if (now.difference(current) > const Duration(milliseconds: 1200)) {
      current = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit!",
        toastLength: Toast.LENGTH_SHORT,
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  Widget _getBody(int tabIndex) {
    if (tabIndex == 0) {
      return const TodayPage();
    } else if (tabIndex == 1) {
      //   return const Calendar();
      // } else if (tabIndex == 2) {
      return const StatsPage();
    } else {
      return const Settings();
    }
  }

  @override
  bool get wantKeepAlive => true;
}
