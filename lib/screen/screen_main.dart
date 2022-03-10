import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:water_resources_application/model/dam.dart';
import 'package:water_resources_application/screen/test3.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Position userLocation;
  late GoogleMapController mapController;

  late Dam dataDam;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<Dam>> getData() async {
    final data = await rootBundle.rootBundle.loadString("assets/data/DAM.json");
    final body = json.decode(data);

    if (body != null) {
      var i = Dam.fromJsonList(body);
      return i;
    }
    return [];
  }

  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(13.7749, 100.5197);

  // final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
      print("\n");
      print(_markers);
    });
  }

  // void _onAddMarkerButtonPressed() {
  //   setState(() {
  //     _markers.add(Marker(
  //       // This marker id can be anything that uniquely identifies each marker.
  //       markerId: MarkerId(_lastMapPosition.toString()),
  //       position: _lastMapPosition,
  //       infoWindow: InfoWindow(
  //         title: 'Really cool place',
  //         snippet: '5 Star Rating',
  //       ),
  //       icon: BitmapDescriptor.defaultMarker,
  //     ));
  //   });
  // }
  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  final Map<String, Marker> _markers = {};

  Future<void> _onMapCreated(
      GoogleMapController controller, AsyncSnapshot<dynamic> dam) async {
    // final googleOffices = await locations.getGoogleOffices();
    setState(() {
      _markers.clear();

      for (var office = 0; office < dam.data.length; office++) {
        final marker = Marker(
          markerId: MarkerId(office.toString()),
          position: LatLng(dam.data[office].properties.latitude,
              dam.data[office].properties.longitude),
          infoWindow: InfoWindow(
            title: "${dam.data[office].properties.damName}",
            snippet:
                "ชื่อ \t : \t ${dam.data[office].properties.damName} \n ประเภทแหล่งน้ำ \t : \t ${dam.data[office].properties.prjType} ",
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        );
        _markers["${dam.data[office].properties.damName}"] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps App'),
          backgroundColor: Colors.green[700],
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) =>
                        _onMapCreated(controller, snapshot),
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: 11.0,
                    ),
                    mapType: _currentMapType,
                    markers: _markers.values.toSet(),
                    onCameraMove: _onCameraMove,
                    myLocationEnabled: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: _onMapTypeButtonPressed,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            backgroundColor: Colors.green,
                            child: const Icon(Icons.map, size: 36.0),
                          ),
                          SizedBox(height: 16.0),
                          // FloatingActionButton(
                          //   onPressed: _onCameraMove,
                          //   materialTapTargetSize: MaterialTapTargetSize.padded,
                          //   backgroundColor: Colors.green,
                          //   child: const Icon(Icons.add_location, size: 36.0),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        //  floatingActionButton: FloatingActionButton.extended(
        //   onPressed: _currentLocation,
        //   label: Text('My Location'),
        //   icon: Icon(Icons.location_on),
        // ),
        //  floatingActionButton: FloatingActionButton.extended(
        //     onPressed: () {
        //       mapController.animateCamera(CameraUpdate.newLatLngZoom(
        //           LatLng(userLocation.latitude, userLocation.longitude), 18));
        //       showDialog(
        //         context: context,
        //         builder: (context) {
        //           return AlertDialog(
        //             content: Text(
        //                 'Your location has been send !\nlat: ${userLocation.latitude} long: ${userLocation.longitude} '),
        //           );
        //         },
        //       );
        //     },
        //     label: Text("Send Location"),
        //     icon: Icon(Icons.near_me),
        //   ),
      ),
    );
  }
}
