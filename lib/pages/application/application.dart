import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_new/common/utils/iconfont.dart';
import 'package:flutter_new/common/values/colors.dart';
import 'package:flutter_new/common/widgets/appbar.dart';
import 'package:flutter_new/pages/account/account.dart';
import 'package:flutter_new/pages/bookmarks/bookmarks.dart';
import 'package:flutter_new/pages/category/category.dart';
import 'package:flutter_new/pages/main/main.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  //当前tab页码
  int _page = 0;
  final List<String> _tabTitles = [
    'Welcome',
    'Category',
    'Bookmarks',
    'Account'
  ];

  //页面控制器
  PageController _pageController;

  // 底部导航项目
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Iconfont.home, color: AppColors.tabBarElement),
      activeIcon: Icon(Iconfont.home, color: AppColors.secondaryElementText),
      label: "main",
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.grid, color: AppColors.tabBarElement),
      activeIcon: Icon(Iconfont.grid, color: AppColors.secondaryElementText),
      label: "category",
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.tag, color: AppColors.tabBarElement),
      activeIcon: Icon(Iconfont.tag, color: AppColors.secondaryElementText),
      label: "tag",
      backgroundColor: AppColors.primaryBackground,
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.me, color: AppColors.tabBarElement),
      activeIcon: Icon(Iconfont.me, color: AppColors.secondaryElementText),
      label: "my",
      backgroundColor: AppColors.primaryBackground,
    ),
  ];

  // tab栏动画
  _handleNavBarTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  // tab栏页码切换
  _handlePageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = new PageController(initialPage: this._page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // 顶部导航
  Widget _buildAppBar() {
    return transparentAppBar(context: context, title: _tabTitles[_page], actions: <Widget> [
      IconButton(
        icon: Icon(
          Icons.search,
          color: AppColors.primaryText,
        ),
        onPressed: () {},
      )
    ]);
  }

  // 底部导航
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: _bottomTabs,
      currentIndex: _page,
      type: BottomNavigationBarType.fixed,
      onTap: _handleNavBarTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        BookmarksPage(),
        AccountPage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
