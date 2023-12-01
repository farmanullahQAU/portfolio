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
          name: "Crypto Exchange",
          imagePath: "assets/images/pic0.jpg",
          descriptions:
              "BitNasdaq is a cryptocurrency exchange that is powered by AI and blockchain technology. It is designed to be a user-friendly and secure platform for buying, selling, and trading cryptocurrencies. BitNasdaq also offers staking rewards for users who hold certain cryptocurrencies. "),
      ProjectModel(
          name: "BitNasdaq trading",
          imagePath: "assets/images/pic.jpg",
          descriptions:
              "BitNasdaq is a cryptocurrency exchange that is powered by AI and blockchain technology. It is designed to be a user-friendly and secure platform for buying, selling, and trading cryptocurrencies. BitNasdaq also offers staking rewards for users who hold certain cryptocurrencies. "),
      ProjectModel(
          name: "Flutter Web Landing Pages ",
          imagePath: "assets/images/pic1.jpeg",
          descriptions:
              "I developed these landing pages for a shoe store using Flutter Web. The pages are designed to be user-friendly and visually appealing, with a focus on showcasing the store's products. I used a variety of Flutter features to create the pages"),
      ProjectModel(
          name: "Expense Manager",
          imagePath: "assets/images/pic2.jpeg",
          descriptions:
              "I developed this financial app using Flutter. The app allows users to track their income and expenses, create budgets, and transfer money."),
      ProjectModel(
          name: "Crypto Trading App",
          imagePath: "assets/images/pic3.jpeg",
          descriptions:
              "I developed this cryptocurrency trading app using Flutter. The app allows users to buy, sell, and track cryptocurrencies. I used a variety of Flutter features to create the app,"),
      ProjectModel(
          name: "Web Dashboard ",
          imagePath: "assets/images/pic4.jpeg",
          descriptions:
              "Static dashboard for a financial app using Flutter Web. The dashboard allows users to view their account balances, transactions, and investments"),
    ];
    currentProject = projects.first;
  }

  onChangeindex(int index, CarouselPageChangedReason reason) {
    currentProject = projects[index];

    update();
  }
}
