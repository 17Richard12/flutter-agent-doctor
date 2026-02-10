import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../../services/places_service.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? _controller;
  Position? _currentPosition;
  final Set<Marker> _markers = {};
  final PlacesService _placesService = PlacesService();

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = position;
    });

    _fetchNearbyPlaces(LatLng(position.latitude, position.longitude));
  }

  Future<void> _fetchNearbyPlaces(LatLng location) async {
    try {
      final pharmacies = await _placesService.searchNearby(location, 'pharmacy');
      final hospitals = await _placesService.searchNearby(location, 'hospital');

      setState(() {
        for (var p in pharmacies) {
          _markers.add(
            Marker(
              markerId: MarkerId('pharmacy_${p.name}'),
              position: p.location,
              infoWindow: InfoWindow(title: p.name),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            ),
          );
        }
        for (var h in hospitals) {
          _markers.add(
            Marker(
              markerId: MarkerId('hospital_${h.name}'),
              position: h.location,
              infoWindow: InfoWindow(title: h.name),
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            ),
          );
        }
      });
    } catch (e) {
      debugPrint('Error fetching places: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearby Services')),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                zoom: 14,
              ),
              onMapCreated: (controller) => _controller = controller,
              markers: _markers,
              myLocationEnabled: true,
            ),
    );
  }
}
