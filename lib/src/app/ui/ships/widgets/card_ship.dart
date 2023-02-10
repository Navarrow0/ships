import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_coding/src/app/data/entities/ship_entitie.dart';

class CardShip extends StatelessWidget {
  const CardShip({Key? key, required this.shipEntitie, this.onTap}) : super(key: key);

  final ShipEntitie shipEntitie;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {

    BorderRadius _borderRadius = BorderRadius.circular(20);

    return Padding(
      padding: REdgeInsets.only(left: 10, right: 10, bottom: 15),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onTap,
        child: Ink(
          height: 110.h,
          padding: REdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: _borderRadius,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.15),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: _borderRadius,
                    child: CachedNetworkImage(
                      imageUrl: shipEntitie.links.patch.small ?? '',
                      width: 90.w,
                      height: 90.h,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 150.w,
                        child: Text(shipEntitie.name, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,),
                      ),
                      Text('Número de vuelo: ${shipEntitie.flightNumber}', style: TextStyle(
                          fontSize: 12.sp
                      ),),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Cohete: ${shipEntitie.rocket.substring(0, 9)}...',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12.sp,),
                      ),
                      Row(
                        children: [
                          Text('Éxito', style: TextStyle(
                              fontSize: 12.sp
                          ),),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: shipEntitie.success != null ? shipEntitie.success! ? Colors.green : Colors.red : Colors.red
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
