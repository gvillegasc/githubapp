import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:githubapp/core/language/app_languages.dart';
import 'package:githubapp/core/language/translator.dart';
import 'package:githubapp/core/responsive.dart';
import 'package:githubapp/injection/injection.dart';
import 'package:githubapp/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:githubapp/presentation/blocs/theme_bloc/theme_bloc.dart';
import 'package:githubapp/presentation/ui/widgets/text_subtitle_regular.dart';
import 'package:githubapp/presentation/ui/widgets/text_title_regular.dart';
import 'package:githubapp/presentation/ui/widgets/text_title_small.dart';

class CommitHeader extends StatelessWidget {
  const CommitHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
    final translator = Translator.findTranslator(context);
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
                    TextSubtitleRegular(
                      text: 'gvillegasc',
                      color: appTheme.primaryColor.withOpacity(.8),
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: responsive.heightR(5),
                      child: Row(
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
                                    context
                                        .read<ThemeBloc>()
                                        .add(ChangeTheme(value));
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: responsive.heightR(5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/pages/icons/ic_usa_flag.svg',
                            height: responsive.inchR(2.2),
                          ),
                          BlocBuilder<LanguageBloc, LanguageState>(
                            builder: (context, state) {
                              return Switch(
                                  activeColor: appTheme.accentColor,
                                  value: state.language.code == 'en',
                                  onChanged: (value) {
                                    final languageEntity =
                                        state.language.code == 'en'
                                            ? getIt<AppLanguages>()
                                                .createLanguages()[1]
                                            : getIt<AppLanguages>()
                                                .createLanguages()[0];
                                    context
                                        .read<LanguageBloc>()
                                        .add(ChangeLanguage(languageEntity));
                                  });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: responsive.inchR(2.5),
            ),
            TextTitleRegular(
              text: 'githubapp',
              color: appTheme.primaryColor,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: responsive.inchR(2.5),
            ),
            TextTitleSmall(
              text: translator.textCommits,
              color: appTheme.primaryColor.withOpacity(.7),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
