import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendedBadge extends StatelessWidget {
  final bool isRecommended;
  final double fontSize;

  RecommendedBadge(this.isRecommended, this.fontSize);

  @override
  Widget build(BuildContext context) {
    if(!isRecommended) return SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        'Recommended',
        style: TextStyle(
          color: Colors.green[900],
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }
}