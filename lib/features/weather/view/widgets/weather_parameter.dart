import 'package:flutter/material.dart';

class WeatherParametersWidget extends StatelessWidget {
  const WeatherParametersWidget({
    super.key,
    required this.title,
    required this.image,
    required this.data,
  });

  final String title;
  final String image;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        Row(
          children: [
            Text(data, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              width: 10,
            ),
            Image(
              image: AssetImage(image),
              height: 20,
            )
          ],
        ),
      ],
    );
  }
}
