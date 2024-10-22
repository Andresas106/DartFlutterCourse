import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildStars extends StatelessWidget {

  final double rating;

  buildStars(this.rating);


  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();

    bool halfStar = (rating - fullStars) >= 0.5;

    int maxStars = 5;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(maxStars, (index) {
          if (index < fullStars) {
            return Icon(Icons.star, color: Colors.amber, size: 30,);
          }
          else if (index == fullStars && halfStar) {
            return Icon(Icons.star_half, color: Colors.amber, size: 30);
          }
          else {
            return Icon(Icons.star_border, color: Colors.amber, size: 30);
          }
        }),

      ),
        if(rating.truncate() == rating)
        Text('${rating.truncate()}', style: TextStyle(fontSize: 20),)
        else
          Text('${rating}', style: TextStyle(fontSize: 20),)
      ],
    );


  }
}