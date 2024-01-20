import 'package:flutter/material.dart';
import 'package:smart_home/screens/dashboard/components/room_widget.dart';
import 'package:smart_home/screens/dashboard/components/weather_greeting_widget.dart';
import 'package:smart_home/screens/dustbin/dustbin_screen.dart';
import 'package:smart_home/screens/front_door/front_door_screen.dart';
import 'package:smart_home/screens/living_room/livingRoom_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              const WeatherGreetingWidget(
                greeting: 'Good Morning,',
                userName: 'Sanjaya Shrestha',
                location: 'Sydney, Australia',
                temperature: '18°C',
                weatherIcon: Icons.cloud,
                humidity: '97% Humidity',
                visibility: '8 km Visibility',
                wind: '3 km/hr SE Wind',
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Rooms',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FrontDoorScreen()),
                      );
                    },
                    child: const Text(
                      'Front Door Lock',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DustbinScreen()),
                      );
                    },
                    child: const Text(
                      'Dustbin',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    buildRoomWidget(
                        title: 'Living Room',
                        imagePath: 'assets/room.jpg',
                        temperature: '20°C',
                        devices: '6 devices',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LivingRoom()),
                          );
                        }),
                    buildRoomWidget(
                        title: 'Kitchen Room',
                        imagePath: 'assets/room.jpg',
                        temperature: '20°C',
                        devices: '6 devices',
                        onTap: () {}),
                    buildRoomWidget(
                        title: 'Master Bedroom',
                        imagePath: 'assets/room.jpg',
                        temperature: '20°C',
                        devices: '6 devices',
                        onTap: () {}),
                    buildRoomWidget(
                        title: 'Guest Bedroom',
                        imagePath: 'assets/room.jpg',
                        temperature: '20°C',
                        devices: '6 devices',
                        onTap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Voice Command',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
