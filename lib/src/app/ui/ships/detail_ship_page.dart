import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momentum/momentum.dart';
import 'package:space_coding/src/app/components/ships/index.dart';
import 'package:space_coding/src/app/data/services/spacex_service.dart';
import 'package:space_coding/src/app/ui/widgets/links.dart';

class DetailShipPage extends StatefulWidget {
  const DetailShipPage({Key? key}) : super(key: key);

  @override
  State<DetailShipPage> createState() => _DetailShipPageState();
}

class _DetailShipPageState extends MomentumState<DetailShipPage> {
  ShipsController? _shipsController;

  @override
  void initMomentumState() {
    _shipsController ??= Momentum.controller<ShipsController>(context);
    super.initMomentumState();
  }

  @override
  Widget build(BuildContext context) {
    final spaceXService = Momentum.service<SpaceXService>(context);
    BorderRadius _borderRadius = BorderRadius.circular(20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff090b2c),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xff090b2c),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: FutureBuilder(
            future: spaceXService.getOneShip(
                shipId: _shipsController!.model.ship_id!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data!.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: snapshot.data?.success != null
                                      ? snapshot.data!.success!
                                          ? Colors.green
                                          : Colors.red
                                      : Colors.red),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 150.h,
                        ),
                        Container(
                          width: double.infinity,
                          padding: REdgeInsets.symmetric(horizontal: 14),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all( Radius.circular(30))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 80.h,
                              ),
                              Text(
                                snapshot.data!.details ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Cohete: ${snapshot.data!.rocket}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Número de vuelo: ${snapshot.data!.flightNumber}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                'Núcleos',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                              ListView.builder(
                                itemCount: snapshot.data!.cores.length,
                                shrinkWrap: true,
                                itemBuilder: (_, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Vuelo ${snapshot.data!.cores[index].flight ?? 0}'),
                                      Text('Núcleo ${snapshot.data!.cores[index].core ?? ''}'),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              LinksBuilder(
                                url: snapshot.data!.links.webcast,
                                socialMediaType: SocialMediaType.YOUTUBE,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              LinksBuilder(
                                url: snapshot.data!.links.article,
                                socialMediaType: SocialMediaType.WEB,
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              LinksBuilder(
                                url: snapshot.data!.links.wikipedia,
                                socialMediaType: SocialMediaType.WIKIPEDIA,
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 50,
                      child: ClipRRect(
                        borderRadius: _borderRadius,
                        child: CachedNetworkImage(
                          imageUrl: snapshot.data!.links.patch.large ?? '',
                          width: 200.w,
                          height: 200.h,
                          fit: BoxFit.contain,
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            }),
      ),
    );
  }
}
