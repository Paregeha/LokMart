import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../gen/assets.gen.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';
import '../../routes/app_routes.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  final LatLng start = const LatLng(40.7440, -73.9950);
  final LatLng mid1 = const LatLng(40.7419, -73.9900);
  final LatLng mid2 = const LatLng(40.7396, -73.9868);
  final LatLng end = const LatLng(40.7360, -73.9820);

  @override
  Widget build(BuildContext context) {
    final routePast = <LatLng>[start, mid1];
    final routeActive = <LatLng>[mid1, mid2, end];

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0,
        title: const Text(
          'Track Order',
          style: TextStyle(
            fontFamily: AppFonts.fontFamily,
            fontWeight: AppFonts.w600semiBold,
            fontSize: 22.0,
            height: 1,
            letterSpacing: 0,
            color: AppColors.dark,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          onPressed: () => context.go(AppRoutes.home),
          icon: SvgPicture.asset(
            Assets.icons.icBack.path,
            width: 24,
            height: 24,
          ),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(initialCenter: mid1, initialZoom: 14),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(markers: []),
            ],
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150.0,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 24,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 46.0,
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.gray1,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  SizedBox(height: 21.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 56.0,
                            height: 56.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Assets.images.man.image(
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(width: 21.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Devin Joseph',
                                style: TextStyle(
                                  fontFamily: AppFonts.fontFamily,
                                  fontWeight: AppFonts.w600semiBold,
                                  fontSize: 18.0,
                                  letterSpacing: -0.24,
                                  color: AppColors.dark,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF1CAF5E),
                                    size: 16.0,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text('ID 2445556'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(Assets.icons.phoneCall.path),
                          SizedBox(width: 23.0),
                          SvgPicture.asset(Assets.icons.chat.path),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
