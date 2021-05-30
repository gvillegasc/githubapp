import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';

class SliverLoading extends StatelessWidget {
  SliverLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Container(
        child: Center(
          child: (Platform.isIOS)
              ? CupertinoTheme(
                  data: CupertinoTheme.of(context)
                      .copyWith(brightness: Brightness.dark),
                  child: const CupertinoActivityIndicator(),
                )
              : CircularProgressIndicator(
                  color: AppColors.white100.withOpacity(.5),
                ),
        ),
      ),
    );
  }
}
