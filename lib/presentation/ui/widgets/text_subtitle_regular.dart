import 'package:flutter/material.dart';
import 'package:githubapp/core/responsive.dart';

class TextSubtitleRegular extends StatelessWidget {
  const TextSubtitleRegular(
      {Key? key,
      required this.text,
      required this.color,
      this.fontWeight = FontWeight.w500,
      this.textAlign,
      this.textDecoration = TextDecoration.none,
      this.overflow,
      this.maxLines})
      : super(key: key);

  final String text;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        decoration: textDecoration,
        fontSize: responsive.spR(13),
        fontFamily: 'Montserrat',
        fontWeight: fontWeight,
      ),
    );
  }
}
