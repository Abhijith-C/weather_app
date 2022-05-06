import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _locationController = TextEditingController();
  final _weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.red,
            ],
          ),
        ),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
              child: Center(
                  child: Text(
                'Weather App',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _locationController,
                decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () {
                          _weatherController
                              .getWeather(_locationController.text.trim());
                          _locationController.clear();
                        },
                        child: const Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    labelText: 'Enter the location',
                    labelStyle: const TextStyle(color: Colors.black),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<WeatherController>(
              builder: (controller) {
                if (controller.weather == null) {
                  return Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.5,
                      child: const Center(
                        child: Text('Please enter the Location',style: TextStyle(fontSize: 18),),
                      ),
                    ),
                  );
                } else {
                  final weather = controller.weather;
                  return Flexible(
                    child: ListView(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.wb_sunny_rounded,
                          color: Colors.yellow,
                          size: 90,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              '${((weather!.temp) / 10).toStringAsFixed(1)} °c',
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weather.state,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 229, 220, 220)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Additional Information',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(
                                            255, 229, 220, 220))),
                                const SizedBox(
                                  height: 18,
                                ),
                                information(weather.weather, 'Weather Status'),
                                information(
                                    weather.humidity.toString(), 'Humidity'),
                                information(weather.description, 'Description'),
                                information(weather.country, 'Country'),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            )
          ],
        )),
      ),
    );
  }

  Widget information(String value, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 20,
        children: [
          Text(
            '$text :',
            style: const TextStyle(
                fontSize: 16, color: const Color.fromARGB(255, 229, 220, 220)),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 229, 220, 220)),
          )
        ],
      ),
    );
  }
}
