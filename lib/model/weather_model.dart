class WeatherModel {
  String weather;
  String description;
  double temp;
  int humidity;
  String country;
  String state;
  WeatherModel({
    required this.weather,
    required this.description,
    required this.temp,
    required this.humidity,
    required this.country,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      'weather': weather,
      'description': description,
      'temp': temp,
      'humidity': humidity,
      'country': country,
      'state': state
    };
  }

  static WeatherModel fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        weather: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        country: json['name'],
        state: json['name']);
  }
}
