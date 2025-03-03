import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/boarding_model.dart';
import '../widgets/on_boarding_item.dart';
import 'login.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  var boardController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        "assets/images/welcome.png", "Welcome", "Let's Get Started!"),
    OnBoardingModel("assets/images/detection.png", "Cancer Detection",
        "Easy to use and fast performance."),
    OnBoardingModel("assets/images/advices.png", "Medical Advices",
        "Useful for preventing lung cancer."),
    OnBoardingModel("assets/images/analysis.png", "High Accuracy",
        "It helps in ascertaining the patient's condition."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
              child: const Text('SKIP'),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    controller: boardController,
                    itemCount: boarding.length,
                    itemBuilder: (context, index) =>
                        onBoardingItem(boarding[index]),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                        controller: boardController,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.teal,
                          dotColor: Colors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          expansionFactor: 4,
                          spacing: 5,
                        ),
                        count: boarding.length),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false);
                        } else {
                          boardController.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
