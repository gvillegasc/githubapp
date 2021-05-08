import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/core/responsive.dart';

class CommitHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.widthR(5),
          vertical: responsive.inchR(2),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    height: responsive.inchR(4.5),
                    width: responsive.inchR(4.5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(7)),
                    child: ExtendedImage.network(
                      'https://avatars.githubusercontent.com/u/40042359?v=4',
                      fit: BoxFit.cover,
                      cache: true,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text('gvillegasc',
                    style: TextStyle(
                        color: AppColors.white100.withOpacity(.8),
                        fontWeight: FontWeight.w400,
                        fontSize: responsive.inchR(2))),
              ],
            ),
            SizedBox(
              height: responsive.inchR(2.5),
            ),
            Text(
              'github-app',
              style: TextStyle(
                  color: AppColors.white100,
                  fontWeight: FontWeight.w700,
                  fontSize: responsive.inchR(2.8)),
            ),
          ],
        ),
      ),
    );
  }
}
