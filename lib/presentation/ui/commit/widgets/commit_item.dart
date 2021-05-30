import 'package:animate_do/animate_do.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:githubapp/core/app_colors.dart';
import 'package:githubapp/core/responsive.dart';
import 'package:githubapp/core/utils/commit_date.dart';
import 'package:githubapp/domain/models/commit.dart';
import 'package:url_launcher/url_launcher.dart';

class CommitItem extends StatelessWidget {
  const CommitItem({Key? key, required this.commit}) : super(key: key);

  final Commit commit;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return FadeIn(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          focusColor: AppColors.white100,
          hoverColor: AppColors.white100,
          highlightColor: AppColors.white100.withOpacity(.2),
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
                    Container(
                      width: responsive.widthR(70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            commit.commit.message,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: AppColors.white100,
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
                                  child: ExtendedImage.network(
                                    commit.committer.avatarUrl,
                                    fit: BoxFit.cover,
                                    cache: true,
                                  ),
                                ),
                              ),
                              SizedBox(width: responsive.inchR(.5)),
                              Text(commit.committer.login,
                                  style: TextStyle(
                                      color: AppColors.white100,
                                      fontWeight: FontWeight.w500,
                                      fontSize: responsive.spR(11))),
                              Text(' authored',
                                  style: TextStyle(
                                      color: AppColors.grey50,
                                      fontWeight: FontWeight.w400,
                                      fontSize: responsive.spR(11)))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: responsive.widthR(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        commitDate(commit.commit.committer.date,
                            DateTime.now().toString()),
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: AppColors.grey50,
                            fontWeight: FontWeight.w400,
                            fontSize: responsive.spR(11)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: responsive.inchR(1.5),
                ),
                Divider(
                  color: AppColors.white100.withOpacity(.2),
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
