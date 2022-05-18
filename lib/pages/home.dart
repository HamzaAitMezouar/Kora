import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/bottomSheet.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late GoogleMapController mapcontroller;
  Set<Marker> markers = {};
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  onMapCreate(GoogleMapController controller) {
    setState(() {
      mapcontroller = controller;
      markers.add(Marker(
          infoWindow: const InfoWindow(
              title: 'Terrain Atlas 1',
              snippet: 'Terrain Atlas 1 ,Tarif 50Dhs'),
          onTap: () {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => bottomSheet(
                      title: 'Terrain Atlas 1',
                    ));
            controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                    target: LatLng(32.346650018099936, -6.346816644072533),
                    zoom: 20,
                    tilt: 50)));
          },
          markerId: const MarkerId('Atlas 1'),
          position: const LatLng(32.346650018099936, -6.346816644072533)));
      //////////////
      markers.add(Marker(
          infoWindow: const InfoWindow(
              title: 'Terrain Atlas 2',
              snippet: 'Terrain Atlas 2 ,Tarif 50Dhs'),
          onTap: () {
            controller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                    target: LatLng(32.34659053554849, -6.3471535965800285),
                    zoom: 20,
                    tilt: 50)));
          },
          markerId: const MarkerId('Atlas 2'),
          position: const LatLng(32.34659053554849, -6.3471535965800285)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: onMapCreate,
        markers: markers,
        initialCameraPosition:
            const CameraPosition(target: LatLng(32.336998652, -6.356498574)),
        onTap: (cord) {
          print(cord);
        },
      ),
    );
  }
}
