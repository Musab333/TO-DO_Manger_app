import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo/shared/styles/color_app.dart';

import '../../../shared/cache/cache_helper.dart';
import '../../widgets/build_onboarding_item.dart';
import '../../widgets/route_navigator.dart';
import '../../widgets/text_button_widget.dart';
import '../layout/home_layout.dart';
import 'on_boarding_data.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var onBoardingController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        actions: [
          TextButtonWidget(
            text: 'تخطي',
            fontSize: 16,
            function: () {
              submitAndSaveOnBoarding();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: onBoardingController,
                onPageChanged: (int index) {
                  if (index == onBoardingDataList.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    isLast = false;
                  }
                },
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => BuildOnBoardingItem(
                  onBoardingData: onBoardingDataList[index],
                ),
                itemCount: onBoardingDataList.length,
              ),
            ),
            Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submitAndSaveOnBoarding();
                    } else {
                      onBoardingController.nextPage(
                        duration: const Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: secondColor,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                SmoothPageIndicator(
                  controller: onBoardingController,
                  count: onBoardingDataList.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: primaryColor,
                    dotHeight: 15,
                    dotWidth: 15,
                    expansionFactor: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void submitAndSaveOnBoarding() {
    CacheHelper.saveData(
      key: 'onboarding',
      value: true,
    ).then((value) => {
          if (value)
            {
              RouteNavigator.navigateAndFinish(
                // ignore: use_build_context_synchronously
                context,
                const HomeLayout(),
              ),
            }
        });
  }
}
