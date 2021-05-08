import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/core/responsive.dart';

class CommitHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Github App',
                  style: TextStyle(
                      color: AppColors.white100,
                      fontWeight: FontWeight.w700,
                      fontSize: responsive.inchR(3)),
                ),
              ],
            ),
            Container(
              child: Text('Description',
                  style: TextStyle(
                      color: AppColors.white100.withOpacity(.8),
                      fontWeight: FontWeight.w400,
                      fontSize: responsive.inchR(2.5))),
            )
          ],
        ),
      ),
    );
  }
}
