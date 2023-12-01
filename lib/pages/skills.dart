import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:port/responsive_wraper.dart';
import 'package:port/widgets/title.dart';

class SkillsView extends StatelessWidget {
  final List<Map<String, dynamic>> _skills = [
    {"path": "assets/images/flutter.svg", "title": "Flutter"},
    {"path": "assets/images/dart.svg", "title": "Dart"},
    {"path": "assets/images/firebase.svg", "title": "Firebase"},
    {"path": "assets/images/java.svg", "title": "Java"},
    {"path": "assets/images/swagger.svg", "title": "Swagger"},
    //
    {"path": "assets/images/git.svg", "title": "Git"},
    {"path": "assets/images/linux.svg", "title": "Linux"},
    {"path": "assets/images/bitcoin.svg", "title": "Crypto"},
    {"path": "assets/images/graphql.svg", "title": "GraphQL"},
    {"path": "assets/images/rest.svg", "title": "Rest API"},
    {"path": "assets/images/material.svg", "title": "Material"},
  ];

  SkillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemsPerRow = ResponsiveWidget.isLargeScreen(context)
        ? 7
        : ResponsiveWidget.isMediumScreen(context)
            ? 5
            : 4;
    final int rowCount = (_skills.length / itemsPerRow).ceil();
    return Container(
      color: Theme.of(context).cardColor,
      padding: ResponsiveWidget.isSmallScreen(context)
          ? EdgeInsets.symmetric(horizontal: context.width * 0.1)
          : EdgeInsets.symmetric(horizontal: context.width * 0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const PageTitle(
            title: "CHECKOUT MY ",
            subtitle: "SKILLS",
          ),

          // Text("Delve into my three-year expertise in Flutter development, crafting seamless mobile and web applications. My skills prioritize innovation, delivering intuitive user experiences that navigate the dynamic digital landscape. Explore the specifics below to uncover the tools driving my contributions.",style: context.textTheme.titleLarge,),

          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: rowCount,
            itemBuilder: (context, rowIndex) {
              final startIndex = rowIndex * itemsPerRow;
              final endIndex = (startIndex + itemsPerRow) <= _skills.length
                  ? (startIndex + itemsPerRow)
                  : _skills.length;

              final rowItems = _skills.sublist(startIndex, endIndex);

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rowItems
                      .map((model) => Flexible(
                            child: SkillIcon(
                              skill: model,
                            ),
                          ))
                      .toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class SkillIcon extends StatefulWidget {
  final Map<String, dynamic> skill;

  const SkillIcon({super.key, required this.skill});

  @override
  _SkillIconState createState() => _SkillIconState();
}

class _SkillIconState extends State<SkillIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final width = ResponsiveWidget.isSmallScreen(context)
        ? context.width * 0.2
        : ResponsiveWidget.isMediumScreen(context)
            ? context.width * 0.2
            : context.width * 0.1;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 16),
        decoration: _decoration(),
        transform: Matrix4.identity()..scale(isHovered ? 1.1 : 1.0),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                widget.skill["path"],
                width: width,
                height: width / 2,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.skill["title"],
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration? _decoration() {
    return BoxDecoration(
      color: Colors.black38,
      // border: Border.all(color: Colors.white10),
      borderRadius: BorderRadius.circular(15),
      boxShadow: isHovered
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                spreadRadius: 5,
                offset: const Offset(0, 1),
              )
            ]
          : [],
    );
  }
}
