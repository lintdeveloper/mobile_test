// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/src/views/dashboard/cart/cart_screen.dart';
import 'package:mobile_test/src/views/dashboard/favorites/favorites_screen.dart';
import 'package:mobile_test/src/views/dashboard/home/home_screen.dart';
import 'package:mobile_test/utils/colors.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = "/dashboard_screen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.secondaryColor,
          body: Container(
            margin: EdgeInsets.only(bottom: _size.height * 0.11),
            child: TabBarView(
              children: [
                HomeScreen(),
                FavoritesScreen(),
                CartScreen()
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
              visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
              child: _buildNavMenu(_size)),
        ),
      ),
      )
    );
  }

  Widget _buildNavMenu(Size size) {
    return Container(
      margin: EdgeInsets.only(left: size.width * 0.08,
        right: size.width * 0.08, bottom: size.height * 0.01),
      height: 66,
      decoration: BoxDecoration(
        color: AppColors.darkBlackColor,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
              blurRadius: 15,
              offset: Offset(0, 10),
              color: AppColors.blackColor.withOpacity(.05),
              spreadRadius: -9 // changes position of shadow
          ),
        ],
      ),
      child: TabBar(
        indicatorColor: Colors.transparent,
        unselectedLabelColor: AppColors.iceGrey,
        labelColor: AppColors.primaryColor,
        tabs: [
          Tab(icon: Icon(Icons.home_outlined, size: 26)),
          Tab(icon: Icon(Icons.favorite_outline_sharp, size: 26)),
          Tab(icon: Icon(Icons.shopping_cart_outlined, size: 26))
        ],
      ),
    );
  }
}
