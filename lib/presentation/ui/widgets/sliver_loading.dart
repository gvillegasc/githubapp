import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverLoading extends StatelessWidget {
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
                  child: CupertinoActivityIndicator(),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
