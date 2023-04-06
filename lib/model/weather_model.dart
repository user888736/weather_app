class Weather {
  String? cityName;
  double? temp;
  double? wind;
  int? pressure;
  double? feels_like;
  int? humidity;
  double? lon;
  double? lat;
  String? description;
  String? icon;
  double? temp_min;
  double? temp_max;
  double? wind_speed;
  int? clouds;

  Weather(
      {this.cityName,
      this.feels_like,
      this.humidity,
      this.pressure,
      this.temp,
      this.wind,
      this.clouds,
      this.description,
      this.icon,
      this.lat,
      this.lon,
      this.temp_max,
      this.temp_min,
      this.wind_speed});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    feels_like = json["main"]["feels_like"];
    humidity = json["main"]["humidity"];
    pressure = json["main"]["pressure"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    clouds = json["clouds"]["all"];
    description = json["weather"]["0"]["description"];
    icon = json["weather"]["0"]["icon"];
    lat = json["coord"]["lat"];
    lon = json["coord"]["lon"];
    temp_max = json["main"]["temp_max"];
    temp_min = json["main"]["temp_min"];
    wind_speed = json["wind"]["speed"];
  }
}
