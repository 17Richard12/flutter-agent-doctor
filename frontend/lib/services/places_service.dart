import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'env_loader.dart';

class Place {
  final String name;
  final LatLng location;
  final String type;

  Place({required this.name, required this.location, required this.type});
}

class PlacesService {
  Future<List<Place>> searchNearby(LatLng location, String type) async {
    // In a real app, this would call Google Places API:
    // https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${location.latitude},${location.longitude}&radius=1500&type=$type&key=$apiKey

    // Simulating API call delay
    await Future.delayed(const Duration(seconds: 1));

    // Return simulated results based on location
    return [
      Place(
        name: 'Nearby $type 1',
        location: LatLng(location.latitude + 0.005, location.longitude + 0.005),
        type: type,
      ),
      Place(
        name: 'Nearby $type 2',
        location: LatLng(location.latitude - 0.003, location.longitude + 0.002),
        type: type,
      ),
    ];
  }
}
