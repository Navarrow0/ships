

import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:space_coding/src/app/components/ships/index.dart';
import 'package:space_coding/src/app/data/services/spacex_service.dart';

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
    return Scaffold(
      body: FutureBuilder(
        future: spaceXService.getOneShip(shipId: _shipsController!.model.ship_id!),
        builder: (context, snapshot) {
          return Column(
            children: [

            ],
          );
        }
      ),
    );
  }
}
