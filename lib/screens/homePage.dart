import 'dart:async';

import 'package:burn_that_cv/config/config.dart';
import 'package:burn_that_cv/models/sliderModel.dart';
import 'package:burn_that_cv/widgets/button.dart';
import 'package:burn_that_cv/widgets/widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < slides.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: new Container(
        height: getHeight(context),
        width: getWidth(context),
        child: new Stack(
          children: [
            new Container(
              height: getHeight(context),
              width: getWidth(context),
              child: RotatedBox(
                quarterTurns: 3,
                child: new Image.asset(
                  "assets/images/banner.PNG",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            new Container(
              height: getHeight(context),
              width: getWidth(context),
              color: kPrimaryColor.withOpacity(0.3),
            ),
            new Container(
              height: getHeight(context),
              width: getWidth(context),
              color: kBlackColor.withOpacity(0.3),
            ),
            BookSlide(
              pageController: pageController,
            ),
            Align(
              alignment: Alignment.center,
              child: new Container(
                margin: EdgeInsets.only(
                  top: 500,
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  children: [
                    new Text(
                      "This book is for more, those that want more, to build more, to achieve more and to have more control over their lives.",
                      style: kStyle.copyWith(
                        color: kPrimaryColor,
                        fontSize: 16.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: new Text(
                        "This book is being printed off in limited runs, so order yours today to avoid disappointment. Once the initial print run is gone, you’ll be forced to wait up to 6 weeks for your copy to ship out.",
                        style: kStyle.copyWith(
                          color: kWhiteColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: new Button(
                  context: context,
                  name: "Buy Now",
                  onPressed: () {},
                  isGradient: false,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
