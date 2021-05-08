import 'package:flutter/material.dart';
import 'package:githubapp/core/responsive.dart';
import 'package:githubapp/domain/models/commit.dart';

class CommitItem extends StatelessWidget {
  const CommitItem({Key? key, required this.commit}) : super(key: key);

  final Commit commit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(),
    );
  }
}
