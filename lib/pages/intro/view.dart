import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:port/constants.dart';
import 'package:port/pages/intro/controller.dart';
import 'package:port/responsive_wraper.dart';
import 'package:port/widgets/button.dart';
import 'package:responsive_framework/responsive_framework.dart';

class IntroView extends StatelessWidget {
  final controller = Get.put(IntroViewController());
  IntroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.symmetric(horizontal: context.width * 0.1)
          : EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ResponsiveRowColumn(
            layout: ResponsiveWidget.isLargeScreen(context)
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            rowMainAxisAlignment: MainAxisAlignment.spaceAround,
            rowMainAxisSize: MainAxisSize.min,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.center,
            rowSpacing: 32,
            columnSpacing: 32,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: context.width * 0.1 + 2,
                  child: Container(
                    width: context.width * 0.2,
                    height: context.width * 0.2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              "assets/images/me.jpg",
                            )),
                        shape: BoxShape.circle),
                  ),
                ),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 2,
                rowFit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: ResponsiveWidget.isLargeScreen(context)
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(controller.greetings,
                        style: context.textTheme.titleSmall
                            ?.copyWith(letterSpacing: 2)),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: "FARMAN ULLAH \n",
                            style: context.theme.textTheme.displaySmall,
                            children: <TextSpan>[
                              TextSpan(
                                  text: "A",
                                  style: context.textTheme.titleLarge
                                      ?.copyWith(color: Colors.red)),
                              TextSpan(
                                text: "${controller.role} ",
                                style: context.textTheme.titleLarge
                                    ?.copyWith(color: Colors.red),
                              ),
                              TextSpan(
                                text: controller.aboutDesc,
                                style: context.theme.textTheme.titleLarge,
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: ResponsiveWidget.isLargeScreen(context)
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            height: 50,
                            child: MaterialButtonWidget(
                              borderColor: Colors.red,
                              color: Colors.redAccent.shade400,
                              hoverColor: const Color.fromARGB(255, 32, 31, 31),
                              child: const Text(
                                "Resume",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                controller.openUrl(resumeUrl);
                              },
                            )),
                        MaterialButton(
                            height: 50,
                            minWidth: 50,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(500),
                            ),
                            // color: Colors.white,
                            hoverColor: Colors.red,
                            hoverElevation: 12,
                            onPressed: () {
                              controller.openUrl(githubUrl);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.github,
                            )),
                        MaterialButton(
                            height: 50,
                            minWidth: 50,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(500),
                            ),
                            // color: Colors.white,
                            hoverColor: Colors.red,
                            hoverElevation: 12,
                            onPressed: () {
                              controller.openUrl(linkedIn);
                            },
                            child: const FaIcon(
                              FontAwesomeIcons.linkedin,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          //  Container(
          //    height: 800.0,
          //    width: context.width ,
          //    decoration: BoxDecoration(
          //      color: context.theme.colorScheme.primary.withOpacity(0.1),
          //     //  borderRadius:
          //     //      BorderRadius.circular(300.0),
          //    ),
          //  ),
        ],
      ),
    );
  }
}
