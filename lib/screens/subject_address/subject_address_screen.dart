import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SubjectAddressScreen extends StatefulWidget {
  const SubjectAddressScreen({super.key});

  @override
  State<SubjectAddressScreen> createState() => _SubjectAddressScreenState();
}

class _SubjectAddressScreenState extends State<SubjectAddressScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
