import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:weather_app/features/weather/view/widgets/weather_parameter.dart';
import 'package:weather_app/features/weather/view_model/weather_provider.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.size,
    required this.weatherProvider,
  });

  final Size size;
  final WeatherProvider weatherProvider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: size.height * 0.56,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${weatherProvider.weather?.weather![0].main ?? 'N/A'} ",
                    style: Theme.of(context).textTheme.titleLarge),
                Text(
                    "${weatherProvider.weather?.weather![0].description ?? 'N/A'} ",
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: size.height * 0.03),
                WeatherParametersWidget(
                  title: AppStrings().tMax,
                  data:
                      '${weatherProvider.weather?.main!.tempMax ?? 'N/A'}${AppStrings().tempUnit}' ??
                          'N/A',
                  image: AppStrings().iconTmax,
                ),
                SizedBox(height: size.height * 0.02),
                WeatherParametersWidget(
                  title: AppStrings().tMin,
                  data:
                      '${weatherProvider.weather!.main!.tempMin ?? 'N/A'}${AppStrings().tempUnit}',
                  image: AppStrings().iconTmin,
                ),
                SizedBox(height: size.height * 0.02),
                WeatherParametersWidget(
                  title: AppStrings().humidity,
                  data:
                      '${weatherProvider.weather!.main!.humidity ?? 'N/A'}${AppStrings().tempUnit}',
                  image: AppStrings().iconHumid,
                ),
                SizedBox(height: size.height * 0.02),
                WeatherParametersWidget(
                  title: AppStrings().cloud,
                  data:
                      '${weatherProvider.weather!.clouds!.all ?? 'N/A'}${AppStrings().tempUnit}',
                  image: AppStrings().iconCloud,
                ),
                SizedBox(height: size.height * 0.02),
                WeatherParametersWidget(
                  title: AppStrings().wind,
                  data:
                      '${weatherProvider.weather!.wind!.speed ?? 'N/A'}${AppStrings().tempUnit}',
                  image: AppStrings().iconWind,
                ),
                SizedBox(height: size.height * 0.02),
                const Divider(
                  thickness: 2,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          child: Image.asset(
            AppStrings().imagePath[weatherProvider.weather?.weather![0].main] ??
                "assets/img/default.png",
            height: size.height * 0.16,
          ),
        )
      ],
    );
  }
}
