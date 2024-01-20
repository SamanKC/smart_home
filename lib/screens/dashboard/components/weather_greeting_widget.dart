import 'package:flutter/material.dart';
import 'package:smart_home/screens/dashboard/components/weather_forecast_widget.dart';

class WeatherGreetingWidget extends StatelessWidget {
  const WeatherGreetingWidget({
    Key? key,
    required this.greeting,
    required this.userName,
    required this.location,
    required this.temperature,
    required this.weatherIcon,
    required this.humidity,
    required this.visibility,
    required this.wind,
  }) : super(key: key);

  final String greeting;
  final String userName;
  final String location;
  final String temperature;
  final IconData weatherIcon;
  final String humidity;
  final String visibility;
  final String wind;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue[200]!,
            Colors.blue[800]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const WeatherForecastWidget(
              date: 'Dec 15, 2023 8:00 am',
              weatherIcon: Icons.wb_cloudy,
              temperature: '18°C',
              location: 'Sydney, Australia',
              humidity: '97%',
              visibility: '8 km ',
              wind: '3 km/hr',
            ),
          ],
        ),
      ),
    );
  }
}
