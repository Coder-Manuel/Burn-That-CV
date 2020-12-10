import 'package:burn_that_cv/config/config.dart';
import 'package:burn_that_cv/models/sliderModel.dart';
import 'package:flutter/material.dart';

class BookSlide extends StatelessWidget {
  final PageController pageController;

  const BookSlide({
    Key key,
    @required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 50,
      ),
      height: getHeight(context) < minHeight ? 400 : getHeight(context) / 2,
      width: getWidth(context),
      child: PageView.builder(
        controller: pageController,
        itemCount: slides.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 1;
              if (pageController.position.haveDimensions) {
                value = pageController.page - index;
                value = (1 - (value.abs() * 2.8)).clamp(0.0, 1.0);
              }
              return SizedBox(
                height: Curves.easeInOut.transform(value) * 200,
                width: Curves.easeInOut.transform(value) * 300,
                child: child,
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                left: 6.0,
                right: 6.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2.0,
                  )),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  slides[index].imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
