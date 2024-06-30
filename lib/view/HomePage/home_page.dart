// home_page.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:safeguard_app/view/HomePage/fire_emergency_page.dart';
import 'package:safeguard_app/view/HomePage/medical_emergency_page.dart';
import 'package:safeguard_app/view/HomePage/natural_disaster_emergency_page.dart';
import 'package:safeguard_app/view/HomePage/rescue_emergency_page.dart';
import 'package:safeguard_app/view/HomePage/violence_emergency_page.dart';
import 'accident_emergency_page.dart';
import 'sos_page.dart'; // Import the new SosPage file

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentLocation = 'Loading...';

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = '${position.latitude}, ${position.longitude}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Current Location: ',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            Text(
              _currentLocation,
              style: const TextStyle(fontSize: 10, color: Colors.black),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/img/logo.png', // Replace with your logo asset
            width: 40,
            height: 40,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Are you in an emergency?',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Press the SOS button, your live location will be shared with the nearest help centre and your emergency contacts',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/img/your_image.png', // Add your illustration image here
                    width: 134.55,
                    height: 169,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SosPage()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5FA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/img/sos_image.png', // Replace with your SOS icon asset
                          width: 206,
                          height: 206,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'What\'s your emergency?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _emergencyButton(
                    context,
                    'assets/img/medical.png',
                    'Medical',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicalEmergencyPage()),
                    ),
                  ),
                  _emergencyButton(
                    context,
                    'assets/img/fire.png',
                    'Fire',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FireEmergencyPage()),
                    ),
                  ),
                  _emergencyButton(
                    context,
                    'assets/img/natural_disaster.png',
                    'Natural Disaster',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const NaturalDisasterEmergencyPage()),
                    ),
                  ),
                  _emergencyButton(
                    context,
                    'assets/img/accident.png',
                    'Accident',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccidentEmergencyPage()),
                    ),
                  ),
                  _emergencyButton(
                    context,
                    'assets/img/violence.png',
                    'Violence',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ViolenceEmergencyPage()),
                    ),
                  ),
                  _emergencyButton(
                    context,
                    'assets/img/rescue.png',
                    'Rescue',
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RescueEmergencyPage()),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emergencyButton(BuildContext context, String iconPath, String label,
      VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: const Color(0xFFEFEFEF)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
