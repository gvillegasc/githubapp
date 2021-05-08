import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/core/responsive.dart';

class CommitError extends StatelessWidget {
  CommitError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        child: Center(
          child: Text(
            'Can not\nget commits :(',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.white100,
                fontWeight: FontWeight.w500,
                fontSize: responsive.inchR(2.5)),
          ),
        ),
      ),
    );
  }
}
