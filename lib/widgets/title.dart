import 'package:flutter/material.dart';
import 'package:port/constants.dart';

import '../responsive_wraper.dart';

class PageTitle extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const PageTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: ResponsiveWidget.isSmallScreen(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              width: 50,
              height: 1,
              color: Color(primaryColor),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              "$title",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(letterSpacing: 2),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Text(
          "$subtitle",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(letterSpacing: 2),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
