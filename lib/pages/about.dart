import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port/responsive_wraper.dart';

import '../widgets/title.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _aboutAnimationController =
      AnimationController(
    value: 0.1,
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> aboutAnimation = CurvedAnimation(
    parent: _aboutAnimationController,
    curve: Curves.ease,
  );

  void initAboutViewAnimationController() {
    _aboutAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _aboutAnimationController.dispose();
      } else if (status == AnimationStatus.dismissed) {
        _aboutAnimationController.dispose();
      }
    });
    _aboutAnimationController.forward();
  }

  @override
  initState() {
    super.initState();

    initAboutViewAnimationController();
  }

  @override
  Widget build(BuildContext context) {
    var aboutInfo = RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        style: context.textTheme.titleLarge,
        children: const <TextSpan>[
          TextSpan(
            text: 'I am a Flutter developer, graduated from ',
          ),
          TextSpan(
            text: 'Quaid Azam University, Islamabadn ',
            style: TextStyle(
              color: Colors.red, // Set text color to red
            ),
          ),
          TextSpan(
            text:
                'As a developer, I have experience working with Flutter for mobile app development. I am proficient in using Flutter\'s widget-based UI framework to create responsive and visually appealing user interfaces.\n',
          ),
          TextSpan(
              text:
                  "I have also demonstrated proficiency in writting smart contracts on the Ethereum blockchain. I bring early experience in successfully executing NFT creation and deployment projects."),
        ],
      ),
    );
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
        ),
        padding: ResponsiveWidget.isSmallScreen(context)
            ? EdgeInsets.symmetric(horizontal: context.width * 0.1)
            : EdgeInsets.symmetric(horizontal: context.width * 0.2),
        child: Center(
            child: ScaleTransition(
          scale: aboutAnimation,
          child: Center(
            child: SizedBox(
              width: context.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const PageTitle(
                    title: "SOME INFO ",
                    subtitle: "ABOUT ME",
                  ),
                  aboutInfo
                ],
              ),
            ),
          ),
        )));
  }
}
