import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  MapType typeMap = MapType.normal;

  void _setMapType(MapType type) {
    setState(() {
      typeMap = type;
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(48.8348933, 2.3287472),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(48.8348933, 2.3287472),
      tilt: 59.440717697143555,
      zoom: 5.151926040649414
  );

  Marker setMarket = Marker(
    markerId: MarkerId('network'),
    position: LatLng(48.8348933, 2.3287472),
    // icon: BitmapDescriptor.fromAsset(
    //   'assets/images/marker.png',
    // ),
    infoWindow: InfoWindow(
      title: "C'est ici Kernix",
      snippet: "Snippet",
    )
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        toolbarOpacity: 1.0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Menu",
          onPressed: () {},
        ),
        backgroundColor: Colors.redAccent,
        title: Text("Storie Maps"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            tooltip: "calendrier",
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: typeMap, // normal hybrid satellite terrain none
              markers: { setMarket },
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.orange,
                    onPressed: () => _setMapType(MapType.normal),
                    label: Text('maps'),
                    icon: Icon(Icons.map),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.blueAccent,
                    onPressed: () => _setMapType(MapType.satellite),
                    label: Text('satelite'),
                    icon: Icon(Icons.satellite),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    onPressed: () => _setMapType(MapType.terrain),
                    label: Text('terrain'),
                    icon: Icon(Icons.terrain),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton:FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: _goToTheLake,
        label: Text('launch'),
        icon: Icon(Icons.zoom_out_map),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
