import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kora/ads/ads.dart';
//import 'package:flutter_native_admob/flutter_native_admob.dart';
//import 'package:flutter_native_admob/native_admob_controller.dart';

import '../widgets/bottomSheet.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  // final adController = NativeAdmobController();
  late GoogleMapController mapcontroller;

  late AdmobBannerSize bannerSize;

  Set<Marker> markers = {};
  // late BitmapDescriptor terrainlmarker;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //terrainlogo();

    //  adController.reloadAd(forceRefresh: true);
  }

  /*void terrainlogo() async {
    print('object///////////////////////');
    terrainlmarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(1080, 5)), 'assets/pin.png');
    print(terrainlmarker);
  }*/

  onMapCreate(GoogleMapController controller) {
    setState(() {
      mapcontroller = controller;
      markers.add(Marker(
          infoWindow: const InfoWindow(
              title: 'Terrain Atlas 1',
              snippet: 'Terrain Atlas 1 ,Tarif 50Dhs'),
          onTap: () {
            mapcontroller.animateCamera(CameraUpdate.newCameraPosition(
                const CameraPosition(
                    target: LatLng(32.346650018099936, -6.346816644072533),
                    zoom: 20,
                    tilt: 20)));
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => bottomSheet(
                      title: 'Terrain Atlas 1',
                    ));
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
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => bottomSheet(
                      title: 'Terrain Atlas 2',
                    ));
          },
          markerId: const MarkerId('Atlas 2'),
          position: const LatLng(32.34659053554849, -6.3471535965800285)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onTap: (cord) {},
            onMapCreated: onMapCreate,
            markers: markers,
            initialCameraPosition: const CameraPosition(
                target: LatLng(32.336998652, -6.356498574)),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 30,
            // child: NativeAdmob(
            //  adUnitID: AdsManager.NativeAdUnitId,
            //  controller: adController,
            //  numberAds: 4,
            // type: NativeAdmobType.full,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/splash2.png'),
                ),
                Text('Kora',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Trajan Pro',
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: AdmobBanner(
              adUnitId: AdsManager.BannerAdUnitId,
              adSize: AdmobBannerSize.SMART_BANNER(context),
            ),
          )
        ],
      ),
    );
  }
}
