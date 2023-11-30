import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:port/constants.dart';
import 'package:port/models/project.dart';
import 'package:port/pages/projects/controller.dart';
import 'package:port/responsive_wraper.dart';
import 'package:port/widgets/title.dart';

class FrontPage extends StatelessWidget {
  final controller = Get.put(ProjectsViewController());
  FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    double viewportFraction = ResponsiveWidget.isLargeScreen(context)
        ? 0.2
        : ResponsiveWidget.isSmallScreen(context)
            ? 0.7
            : 0.3;
    double aspectRatio = ResponsiveWidget.isLargeScreen(context) ? 3 : 2;
    return Container(
      color: Theme.of(context).cardColor,
      padding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.symmetric(horizontal: context.width * 0.1)
          : EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: Center(
        child: SizedBox(
          width: context.width,
          child: GetBuilder<ProjectsViewController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const PageTitle(
                    title: "HAVE A LOOT AT MY", subtitle: "PROJECTS"),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      onPageChanged: controller.onChangeindex,
                      aspectRatio: aspectRatio,
                      viewportFraction: viewportFraction,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      reverse: false,
                      autoPlay: true,
                    ),
                    items: controller.projects
                        .map((item) => ProjectWidget(
                              projectModel: item,
                            ))
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.projects
                      .map((project) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor:
                                  project == controller.currentProject
                                      ? Color(primaryColor)
                                      : Get.isDarkMode
                                          ? Colors.white10
                                          : Colors.black12,
                            ),
                          ))
                      .toList(),
                )

                // Expanded(
                //   child: ListView.builder(
                //     physics: NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemCount: rowCount,
                //     itemBuilder: (context, rowIndex) {
                //       final startIndex = rowIndex * itemsPerRow;
                //       final endIndex =
                //           (startIndex + itemsPerRow) <= controller.projects.length
                //               ? (startIndex + itemsPerRow)
                //               : controller.projects.length;

                //       final rowItems =
                //           controller.projects.sublist(startIndex, endIndex);

                //       return Row(
                //        mainAxisSize: MainAxisSize.min,
                //         mainAxisAlignment:

                //         MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: rowItems
                //             .map((project) =>
                //          Flexible(

                //            child: ProjectWidget(
                //                          projectModel: project,
                //                            ),
                //          ))
                //             .toList(),
                //       );
                //     },
                //   ),
                // )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class ProjectWidget extends StatelessWidget {
  final ProjectModel projectModel;

  ProjectWidget({super.key, required this.projectModel});

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProjectsViewController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("${projectModel.imagePath}")),
          borderRadius: BorderRadius.circular(15),
        ),
        // transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
        padding: const EdgeInsets.all(8),
        child: Align(
            alignment: Alignment.center,
            child: controller.currentProject == projectModel
                ? InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: projectModel.name,
                          content: Builder(
                            builder: (_) => SizedBox(
                              width: context.width * 0.5,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: context.width * 0.2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "${projectModel.imagePath}")),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  Text(
                                    projectModel.descriptions,
                                    style: context.textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onConfirm: () {
                            Get.back();
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color(primaryColor).withOpacity(0.8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          projectModel.name,
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    ),
                  )
                : null),
      );
    });
  }
}
