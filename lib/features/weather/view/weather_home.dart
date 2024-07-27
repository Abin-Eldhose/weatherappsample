import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/strings.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/core/utilities/date_formatter.dart';
import 'package:weather_app/features/auth/view/login_page.dart';
import 'package:weather_app/features/auth/view_model/auth_provider.dart';
import 'package:weather_app/features/weather/view/widgets/bottom_sheet.dart';
import 'package:weather_app/features/weather/view_model/weather_provider.dart';

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final weatherProvider = Provider.of<WeatherProvider>(context);

    void showWeatherBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return BottomSheetWidget(
            size: size,
            weatherProvider: weatherProvider,
          );
        },
      );
    }

    final TextEditingController cityController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppStrings().bgImage),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, right: 15, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () async {
                            await Provider.of<LoginProvider>(context,
                                    listen: false)
                                .logout();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneNumberScreen()));
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "log out",
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.45,
                    child: TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          onPressed: () async {
                            await weatherProvider.getData(cityController.text);
                            showWeatherBottomSheet();
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${weatherProvider.weather?.main?.temp?.toStringAsFixed(1) ?? '...'}${AppStrings().tempUnit}',
                      style: Theme.of(context).textTheme.headlineLarge),
                  Text(weatherProvider.weather?.name ?? 'Search a city',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text(formatDateTime(DateTime.now()),
                      style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
