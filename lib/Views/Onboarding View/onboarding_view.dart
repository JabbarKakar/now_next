import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:now_next/App%20Constants/App%20Colors/app_colors.dart';
import 'package:now_next/Providers/my_state.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Consumer<MyState>(builder: (context, myStateProvider, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 400.h,
                child: PageView(
                    controller: myStateProvider.pageController,
                    children: myStateProvider.screenList),
              ),
              SizedBox(
                height: 130.h,
              ),
              SmoothPageIndicator(
                controller: myStateProvider.pageController,
                count: myStateProvider.screenList.length,
                effect: SlideEffect(
                    type: SlideType.slideUnder,
                    radius: 10,
                    dotWidth: 20.w,
                    dotHeight: 10.0,
                    dotColor: Colors.grey,
                    activeDotColor: AppColors.primaryColor),
              ),
              SizedBox(
                height: 35.h,
              ),
              GestureDetector(
                onTap: () => myStateProvider.nextPage(),
                child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: Center(child: Text('Next'))),
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          );
        }),
      ],
    ));
  }
}
