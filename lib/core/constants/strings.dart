class AppStrings {
  //in app Texts
  final String tempUnit = '°';
  final String humidity = 'Humidity';
  final String cloud = 'Cloudy';
  final String wind = 'Wind';
  final String tMin = 'Temp Min';
  final String tMax = 'Temp Max';

  //image Strings
  final String bgImage = "assets/images/bgImage.jpg";

  //icon images
  final String iconCloud = "assets/icons/cloud.png";
  final String iconHumid = "assets/icons/humidity.png";
  final String iconTmax = "assets/icons/tmax.png";
  final String iconTmin = "assets/icons/tmin.png";
  final String iconWind = "assets/icons/wind.png";

  Map<String, dynamic> imagePath = {
    "Clear": "assets/images/sunny.png",
    "Thunderstorm": "assets/images/thunderstorm.png",
    "Clouds": "assets/images/cloudy.png",
    "Drizzle": "assets/images/heavy-rain.png",
    "Few-clouds": "assets/images/scattered  cloud.png",
    "Mist": "assets/images/mist.png",
    "Snow": "assets/images/snowy.png",
    "Rain": "assets/images/rainy.png"
  };
}
