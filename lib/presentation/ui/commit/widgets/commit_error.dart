import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/presentation/ui/widgets/text_title_small.dart';

class CommitError extends StatelessWidget {
  const CommitError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: TextTitleSmall(
          text: 'Can not\nget commits :(',
          textAlign: TextAlign.center,
          color: AppColors.white100,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
