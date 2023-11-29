import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

import '../../models/project.dart';

class ProjectsViewController extends GetxController {
  late ProjectModel currentProject;
  late final List<ProjectModel> projects;

  @override
  void onInit() {
    initProjects();

    super.onInit();
  }

  void initProjects() {
    projects = [
      ProjectModel(
          name: "Bitnadaq",
          imagePath: "assets/images/p1.jpeg",
          descriptions: "Crypto Exchange"),
      ProjectModel(
          name: "Expense Manager",
          imagePath: "assets/images/p1.jpeg",
          descriptions: "Projects Tracking App"),
      ProjectModel(
          name: "Property Chowk",
          imagePath: "assets/images/p3.jpeg",
          descriptions: "Property Portal"),
      ProjectModel(
          name: "Mohra",
          imagePath: "assets/images/p2.jpeg",
          descriptions: "Social Media App"),
      ProjectModel(
          name: "Bitnadaq",
          imagePath: "assets/images/p1.jpeg",
          descriptions: "descriton goes here"),
      //
      ProjectModel(
          name: "Mohra",
          imagePath: "assets/images/p2.jpeg",
          descriptions: "Social Media App"),
      ProjectModel(
          name: "Bitnadaq",
          imagePath: "assets/images/p1.jpeg",
          descriptions: "descriton goes here"),
      ProjectModel(
          name: "Mohra",
          imagePath: "assets/images/p2.jpeg",
          descriptions: "Social Media App"),
      ProjectModel(
          name: "Bitnadaq",
          imagePath: "assets/images/p1.jpeg",
          descriptions: "descriton goes here")
    ];
    currentProject = projects.first;
  }

  onChangeindex(int index, CarouselPageChangedReason reason) {
    currentProject = projects[index];

    update();
  }
}
