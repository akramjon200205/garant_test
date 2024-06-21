import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_garant/future/common/assets.dart';
import 'package:test_garant/future/presentation/home/home_page.dart';
import 'package:test_garant/future/presentation/profile/profile.dart';
import 'package:test_garant/future/presentation/qoidalar/qoidalar.dart';
import 'package:test_garant/future/presentation/test_yechish/pages/test_yechish.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({super.key, this.initialPage = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool canPop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller, // Привязываем контроллер к PageView
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        children: const [
          HomePage(),
          QoidalarPage(),
          TestYechishPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          nextPage(value);
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.home),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.qoidalar),
            label: "Qoidalar",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.test),
            label: "Test",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.icons.profile),
            label: "Profile",
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }

  nextPage(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {});
    }
  }
}
