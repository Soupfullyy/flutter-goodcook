import 'package:flutter/material.dart';
import 'star.dart';
class LargeCard extends StatelessWidget {
  final String img;
  final String title;
  const LargeCard({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // constraints: BoxConstraints.tight(Size(200, 200)),
      height: 140,
      child: Card(
        elevation: 6.0,
        margin: const EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/$img'),
              fit: BoxFit.cover,
              height: 140,
              width: 140,
            ),
            // act as padding for text after image
            const SizedBox(width: 16, height: 16),
            // to wrap long text based on cross-axis
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.visible),
                    maxLines: 2,
                  )),
                  const StarRating(
                    onRatingChanged: null,
                  ),
                  const Row(
                    children: [Icon(Icons.access_time), Text('1hr 30mins')],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}