class WeatherModel {
  String weather;
  String description;
  double temp;
  int humidity;
  String country;
  String state;
  double lon;
  double lat;
  double speed;
  WeatherModel({
    required this.weather,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.country,
    required this.state,
    required this.lon,
    required this.lat,
    required this.speed,
  });

  static WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        weather: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        country: json['sys']['country'],
        lon: json['coord']['lon'],
        lat: json['coord']['lat'],
        speed: json['wind']['speed'],
        state: json['name']);
  }
}
