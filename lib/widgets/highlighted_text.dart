import 'package:flutter/material.dart';
import 'package:tapinvest/core/utils/app_colors.dart';

class HighlightedText extends StatelessWidget {
  final String text;
  final String query;
  final TextStyle style;
  final TextStyle highlightStyle;
  final Color highlightBackgroundColor;
  final double highlightBorderRadius;

  const HighlightedText({
    super.key,
    required this.text,
    required this.query,
    required this.style,
    required this.highlightStyle,
    this.highlightBackgroundColor = AppColors.brown,
    this.highlightBorderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return Text(text, style: style);
    }

    final matches = <Match>[];
    final pattern = RegExp(RegExp.escape(query), caseSensitive: false);

    pattern.allMatches(text).forEach((match) {
      matches.add(match);
    });

    if (matches.isEmpty) {
      return Text(text, style: style);
    }

    final spans = <InlineSpan>[];
    int lastMatchEnd = 0;

    for (final match in matches) {
      // Add text before the match
      if (match.start > lastMatchEnd) {
        spans.add(
          TextSpan(
            text: text.substring(lastMatchEnd, match.start),
            style: style,
          ),
        );
      }

      // Add the highlighted match with rounded background
      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 1.0),
            decoration: BoxDecoration(
              color: highlightBackgroundColor,
              borderRadius: BorderRadius.circular(highlightBorderRadius),
            ),
            child: Text(
              text.substring(match.start, match.end),
              style: highlightStyle,
            ),
          ),
        ),
      );

      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(text: text.substring(lastMatchEnd), style: style));
    }

    return RichText(text: TextSpan(children: spans));
  }
}
