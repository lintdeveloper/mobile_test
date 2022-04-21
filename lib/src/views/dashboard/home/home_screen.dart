import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/views/dashboard/home/trending_view.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static const List<Tab> _tabs = <Tab>[Tab(text: "Trending"),
    Tab(text: "Decor"), Tab(text: "Chairs")
  ];
  late Animation<Offset> _gmAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ResponsiveSafeArea(builder: (context, _size) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(left: _size.width * 0.08,
                    right: _size.width * 0.08, top: _size.width * 0.1),
                child: Text("Discover \nNew items", style: AppTextStyle.textSize22.copyWith(
                  color: AppColors.darkBlackColor.withOpacity(0.8), letterSpacing: 1
                )),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.only(top: _size.height * 0.04,  bottom: _size.width * 0.03,),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: _size.width * 0.66,
                      margin: EdgeInsets.only(left: _size.width * 0.08,
                          right: _size.width * 0.032),
                      decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(blurRadius: 15,
                            offset: Offset(0, 10),
                            color: AppColors.blackColor.withOpacity(.05),
                            spreadRadius: -9 // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                cursorColor: AppColors.darkBlackColor,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.secondaryColor),
                                decoration: InputDecoration(border: InputBorder.none,
                                  hintText: 'Search', prefixIcon:  Icon(Icons.search),
                                  hintStyle:TextStyle(fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: AppColors.blackColor),
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(color: AppColors.darkBlackColor,
                        borderRadius: BorderRadius.circular(16.0),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            AppColors.blackColor,
                            AppColors.darkBlackColor,
                          ],
                        )
                      ),
                      child: Icon(Icons.filter_alt_sharp, color: AppColors.iceGrey),
                    )
                  ],
                ),
              )
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.08, vertical: 0),
              sliver: SliverAppBar(
                backgroundColor: AppColors.secondaryColor,
                toolbarHeight: 0,
                pinned: true,
                bottom:  TabBar(
                  indicatorColor: AppColors.primaryColor,
                  unselectedLabelColor: AppColors.blackColor.withOpacity(0.8),
                  labelColor: AppColors.primaryColor,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: _tabs
                ),
                // flexibleSpace: FlexibleSpaceBar(
                //   background: Container(
                //           child: TabBar(
                //             indicatorColor: Colors.transparent,
                //             unselectedLabelColor: AppColors.iceGrey,
                //             labelColor: AppColors.primaryColor,
                //             tabs: [
                //               Tab(icon: Icon(Icons.home_outlined, size: 26)),
                //               Tab(icon: Icon(Icons.favorite_outline_sharp, size: 26)),
                //               Tab(icon: Icon(Icons.shopping_cart_outlined, size: 26))
                //             ],
                //           ),
                //         )
                // ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.secondaryColor,
                height: _size.height * 0.58,
                margin: EdgeInsets.only(top: _size.height * 0.04),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    TrendingView(),
                    Center(child: Text("HIiid")),
                    Center(child: Text("HI"))
                  ],
                ),
              ),
            )
          ],
        );
        // return SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       CustomScrollView(
        //         slivers: [
        //           SliverAppBar(
        //             expandedHeight: 200,
        //             flexibleSpace: FlexibleSpaceBar(
        //               background: Container(color: Colors.green),
        //             ),
        //           ),
        //         ],
        //       ),
        //       // Container(
        //       //   child: TabBar(
        //       //     indicatorColor: Colors.transparent,
        //       //     unselectedLabelColor: AppColors.iceGrey,
        //       //     labelColor: AppColors.primaryColor,
        //       //     tabs: [
        //       //       Tab(icon: Icon(Icons.home_outlined, size: 26)),
        //       //       Tab(icon: Icon(Icons.favorite_outline_sharp, size: 26)),
        //       //       Tab(icon: Icon(Icons.shopping_cart_outlined, size: 26))
        //       //     ],
        //       //   ),,
        //       // )
        //       // DefaultTabController(length: 3, child: Scaffold(
        //       //   body: TabBarView(
        //       //     children: [
        //       //       Center(child: Text("Hi")),
        //       //       Text("HI"),
        //       //       Text("HI")
        //       //     ],
        //       //   ),
        //       // ))
        //     ],
        //   ),
        // );
      })
    );
  }
}
