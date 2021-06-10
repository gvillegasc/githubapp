import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/blocs/commit_bloc/commit_bloc.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_header.dart';
import 'package:githubapp/presentation/ui/commit/widgets/commit_list.dart';
import 'package:githubapp/presentation/ui/widgets/invisible_scroll.dart';

class CommitPage extends StatelessWidget {
  const CommitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<CommitBloc>(),
        child: const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            body: SafeArea(
              bottom: false,
              child: InvisibleScroll(
                child: CustomScrollView(
                  slivers: [CommitHeader(), CommitList()],
                ),
              ),
            ),
          ),
        ));
  }
}
