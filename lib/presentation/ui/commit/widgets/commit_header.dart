import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:githubapp/core/responsive.dart';
import 'package:githubapp/presentation/blocs/theme_bloc/theme_bloc.dart';

class CommitHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Container(
                        height: responsive.inchR(4.5),
                        width: responsive.inchR(4.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7)),
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
                            color: appTheme.primaryColor.withOpacity(.8),
                            fontWeight: FontWeight.w400,
                            fontSize: responsive.spR(13))),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/pages/icons/ic_moon.svg',
                      height: responsive.inchR(2.5),
                      color: appTheme.primaryColor.withOpacity(.8),
                    ),
                    BlocBuilder<ThemeBloc, ThemeState>(
                      builder: (context, state) {
                        return Switch(
                            activeColor: appTheme.accentColor,
                            value: state.isDark,
                            onChanged: (value) {
                              context.read<ThemeBloc>().add(ChangeTheme(value));
                            });
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: responsive.inchR(2.5),
            ),
            GestureDetector(
              onTap: () {
                print(responsive.inch);
                print(responsive.height);
                print(responsive.width);
                print(responsive.spR(1));
                print(responsive.height / responsive.width);
              },
              child: Text(
                'githubapp',
                style: TextStyle(
                    color: appTheme.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: responsive.spR(18)),
              ),
            ),
            SizedBox(
              height: responsive.inchR(2.5),
            ),
            Text(
              'Commits',
              style: TextStyle(
                  color: appTheme.primaryColor.withOpacity(.7),
                  fontWeight: FontWeight.w600,
                  fontSize: responsive.spR(15)),
            ),
          ],
        ),
      ),
    );
  }
}
