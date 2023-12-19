import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port/constants.dart';
import 'package:port/pages/home/controller.dart';
import 'package:port/responsive_wraper.dart';

class HomePage extends GetView<HomeViewController> {
  @override
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GetBuilder<HomeViewController>(
            id: "home",
            builder: (_) {
              return SafeArea(
                child: Scaffold(
                  appBar: !ResponsiveWidget.isLargeScreen(context)
                      ? AppBar(
                          leading: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              controller.onMenueToggle();
                            },
                          ),
                          backgroundColor: Theme.of(context).cardColor,
                        )
                      : null,
                  body: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                          width: context.width,
                          // decoration: const BoxDecoration(
                          //     color: Color(primaryColor),
                          //     image: DecorationImage(
                          //         fit: BoxFit.cover,
                          //         image: AssetImage(
                          //             "assets/images/pic2.jpg"))),
                          child: PageView.builder(
                              pageSnapping: false,
                              onPageChanged: controller.onPageChanged,
                              scrollDirection: Axis.vertical,
                              itemCount: controller.pages.length,
                              controller: controller.pageController,
                              itemBuilder: (context, index) {
                                return controller.pages[index];
                              })),

                      if ((controller.isShow == true &&
                              !ResponsiveWidget.isLargeScreen(context)) ||
                          ResponsiveWidget.isLargeScreen(context))
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          width: ResponsiveWidget.isLargeScreen(context)
                              ? controller.isHovered
                                  ? 250
                                  : 150
                              : 150,
                          child: MouseRegion(
                            onEnter: (_) => controller.onHover(true),
                            onExit: (_) => controller.onHover(false),
                            child: NavigationRail(
                                elevation: 8,
                                leading: const Text(
                                  "FU",
                                  style: TextStyle(
                                      fontSize: 40,
                                      height: 2,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.dotted,
                                      decorationColor: Color(primaryColor)),
                                ),
                                useIndicator: true,

                                // indicatorColor: const Color.fromARGB(255, 32, 31, 31),

                                groupAlignment: 0.0,
                                // backgroundColor:
                                //     Theme.of(context).navigationRailTheme.backgroundColor,
                                // indicatorColor: Color(primaryColor),
                                extended: controller.isHovered,
                                destinations: const [
                                  NavigationRailDestination(
                                    icon: Icon(Icons.home),
                                    label: Text('Home'),
                                  ),
                                  NavigationRailDestination(
                                    icon: Icon(Icons.person_2_outlined),
                                    label: Text('About'),
                                  ),
                                  NavigationRailDestination(
                                    icon: Icon(Icons.code),
                                    label: Text('Works'),
                                  ),
                                  NavigationRailDestination(
                                    icon: Icon(Icons.work_history),
                                    selectedIcon: Icon(Icons.work),
                                    label: Text('Projects'),
                                  ),
                                ],
                                selectedIndex: controller.selectedIndex,
                                onDestinationSelected:
                                    controller.onDestinationSelected),
                          ),
                        ),
                      // Align(

                      //   alignment: Alignment.centerRight,
                      //   child: AnimatedContainer(

                      //     decoration: BoxDecoration(
                      //               color:context.theme.canvasColor,

                      //       borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30))),
                      //               duration: Duration(milliseconds: 500),

                      //               width:controller.isHovered? 100:50,height: Get.height*0.5,
                      //             child: Column(children: [

                      //               IconButton(onPressed: (){}, icon: Icon(Icons.abc))
                      //             ]),

                      //             ),
                      // )
                    ],
                  ),
                  floatingActionButton: Obx(
                    () => GestureDetector(
                      onTap: controller.changeTheme,
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                            opacity: animation,
                            child:
                                ScaleTransition(scale: animation, child: child),
                          );
                        },
                        child: controller.isDark
                            ? Icon(
                                Icons.brightness_7,
                                key: UniqueKey(),
                                size: 40,
                                color: Color(primaryColor),
                              )
                            : Icon(
                                Icons.brightness_3,
                                key: UniqueKey(),
                                size: 40,
                                color: Colors.indigo,
                              ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
