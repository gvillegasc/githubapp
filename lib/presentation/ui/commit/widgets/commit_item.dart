import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:githubapp/core/language/translator.dart';
import 'package:githubapp/core/language/translator/app_translator.dart';
import 'package:githubapp/core/responsive.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:githubapp/presentation/ui/widgets/text_paragraph_regular.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitItem extends StatelessWidget {
  const CommitItem({Key? key, required this.commit}) : super(key: key);

  final Commit commit;

  String _commitDate(String commitDate, AppTranslator translator) {
    try {
      final different = DateTime.now().difference(DateTime.parse(commitDate));
      final differentHours = different.inHours;
      if (different.inMinutes <= 0) {
        return '${different.inSeconds} ${translator.textSeconds}';
      } else if (differentHours <= 0) {
        return '${different.inMinutes} ${translator.textMinutes}';
      } else if (differentHours <= 24) {
        return '${different.inHours} ${translator.textHours}';
      } else {
        return '${different.inDays} ${translator.textDays}';
      }
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final appTheme = Theme.of(context);
    final translator = Translator.findTranslator(context);
    return FadeIn(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          focusColor: appTheme.primaryColor,
          hoverColor: appTheme.primaryColor,
          highlightColor: appTheme.primaryColor.withOpacity(.2),
          onTap: () async {
            await canLaunch(commit.htmlUrl)
                ? await launch(commit.htmlUrl)
                : throw 'Could not launch ${commit.htmlUrl}';
          },
          child: Container(
            padding: EdgeInsets.only(
                left: responsive.widthR(5),
                right: responsive.widthR(5),
                top: responsive.inchR(1.2)),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: responsive.widthR(70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            commit.commit.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: appTheme.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: responsive.spR(12.5)),
                          ),
                          SizedBox(height: responsive.inchR(.5)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  height: responsive.inchR(2.5),
                                  width: responsive.inchR(2.5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CachedNetworkImage(
                                    imageUrl: commit.committer.avatarUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: responsive.inchR(.5)),
                              TextParagraphRegular(
                                text: commit.committer.login,
                                color: appTheme.primaryColor,
                              ),
                              TextParagraphRegular(
                                key: Key(translator.textAuthored),
                                text: ' ${translator.textAuthored}',
                                color: appTheme.accentColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: responsive.widthR(20),
                      alignment: Alignment.centerRight,
                      child: TextParagraphRegular(
                        text: _commitDate(
                            commit.commit.committer.date, translator),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                        color: appTheme.primaryColor.withOpacity(.7),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: responsive.inchR(1.5),
                ),
                Divider(
                  color: appTheme.primaryColor.withOpacity(.2),
                  height: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
