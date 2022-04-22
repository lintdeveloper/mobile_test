import 'package:flutter/material.dart';
import 'package:mobile_test/shared/shared.dart';
import 'package:mobile_test/src/views/dashboard/dashboard.dart';
import 'package:mobile_test/utils/colors.dart';
import 'package:mobile_test/utils/images.dart';
import 'package:mobile_test/utils/text_style.dart';
import 'package:ripple_animation/ripple_animation.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = "/landing_screen";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {

  late final AnimationController _titleController;
  late final Animation<Offset> _titleOffsetAnimation;
  late final AnimationController _headingController;
  late final Animation<Offset> _headingOffsetAnimation;
  late final AnimationController _contentController;
  late final Animation<Offset> _contentOffsetAnimation;
  late final AnimationController _arrowController;
  late final Animation<Offset> _arrowOffsetAnimation;
  late final AnimationController _circleController;
  late final Animation<Offset> _circleOffsetAnimation;
  double _opacity = 1.0;
  Key? _key;
  bool _isVisible = false;


  @override
  void initState() {
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this)..forward(from: -0.05);
    _titleOffsetAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _titleController,
      curve: Curves.bounceIn,
    ));

    _headingController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this)..forward(from: -0.07);
    _headingOffsetAnimation = Tween<Offset>(
      begin: const Offset(0.35, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _headingController,
      curve: Curves.easeIn,
    ));

    _contentController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this)..forward(from: -0.07);
    _contentOffsetAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _contentController,
      curve: Curves.bounceIn,
    ));

    _arrowController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this)..forward(from: -0.07);
    _arrowOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _arrowController,
      curve: Curves.bounceIn,
    ));

    _circleController = AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this)..forward(from: -1.0);
    _circleOffsetAnimation = Tween<Offset>(
      begin: const Offset(-1.2, 0.69),
      end: const Offset(0.0, 0.69),
    ).animate(CurvedAnimation(
      parent: _circleController,
      curve: Curves.bounceIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _headingController.dispose();
    _contentController.dispose();
    _arrowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveSafeArea(
        builder: (context, _size) {
          return Stack(
            children: [
              Container(
                color: AppColors.yellowColor,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 1),
                child: SlideTransition(
                  position: _circleOffsetAnimation,
                  child: Container(
                    height: _size.height * 0.46,
                    width: _size.width * 0.63,
                    decoration: BoxDecoration(
                      color: AppColors.pinkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_size.width * 0.01),
                        topRight: Radius.circular(_size.width * 1),
                        bottomRight: Radius.circular(_size.width * 1),
                        bottomLeft: Radius.circular(_size.width * 0.0),
                      )
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: _size.width * 0.08,
                    left: _size.width * 0.08, top: _size.height * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideTransition(
                      position: _titleOffsetAnimation,
                      child: RichText(text: TextSpan(
                        text: "Neo", style: AppTextStyle.textSize24.copyWith(
                          fontSize: 34, color: AppColors.darkBlackColor.withOpacity(0.8)),
                        children: [
                          TextSpan(text: "Decor", style: AppTextStyle.textSize20.copyWith(
                            fontSize: 34, color: AppColors.primaryColor.withOpacity(0.8)))
                        ]
                      )),
                    ),
                    SizedBox(height: _size.height * 0.15),
                    SlideTransition(
                      position: _headingOffsetAnimation,
                      child: Text("Let\'s \ndecor \nyour home", style: AppTextStyle.textSize32.copyWith(fontSize: 38,
                          color: AppColors.darkBlackColor.withOpacity(0.8), fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(height: _size.height * 0.05),
                    SlideTransition(
                      position: _contentOffsetAnimation,
                      child: Text("Be faithful to your own taste, because \nnothing your really like is is ever out of style", style: AppTextStyle.textSize12.copyWith(
                        color: AppColors.blackColor.withOpacity(0.8), fontSize: 13.5
                      )),
                    ),
                    SizedBox(height: _size.height * 0.05),
                    SlideTransition(
                      position: _arrowOffsetAnimation,
                      child: InkWell(
                          onTap: () async {
                            setState(() {
                              _isVisible = true;
                              _opacity = _opacity == 0 ? 1.0 : 0.0;
                            });
                            await Future.delayed(Duration(seconds: 2)).then((_) {
                              _key = UniqueKey();
                            });
                            Navigator.pushNamed(context, DashboardScreen.routeName);
                          },
                          child: Image.asset(AppImages.longArrow,
                          width: _size.width * 0.1))),
                  ],
                ),
              ),
              Visibility(
                visible: _isVisible,
                child: Positioned(left: - _size.width * .75,
                  right: 0,
                  top: _size.height * 0.572,
                  child: Center(
                    child: RippleAnimation(
                        repeat: false,
                        key: _key,
                        color:  Color(0xffFBE8E3),
                        minRadius: _size.height * 1.0,
                        ripplesCount: 1,
                        child: Container()
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
