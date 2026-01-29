import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback? onRatingChanged;
  final Color color;

  const StarRating({this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color = Colors.yellow});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Theme.of(context).highlightColor,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
      );
    }
    return InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged!(index + 1.0),
      child: 
        icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> ListStars = List.generate(starCount, (index) => buildStar(context, index));

    return Row(
        children: [
            for(int i = 0; i < ListStars.length; i++) buildStar(context, starCount),
            Text('$rating'),
        ],
    );
  }
}