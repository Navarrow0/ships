import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';
import 'package:space_coding/src/app/components/ships/index.dart';
import 'package:space_coding/src/app/data/services/spacex_service.dart';
import 'package:space_coding/src/app/ui/ships/detail_ship_page.dart';
import 'package:space_coding/src/app/ui/ships/widgets/card_ship.dart';

class MainShips extends StatefulWidget {
  const MainShips({Key? key}) : super(key: key);

  @override
  State<MainShips> createState() => _MainShipsState();
}

class _MainShipsState extends MomentumState<MainShips> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              FutureBuilder(
                  future: spaceXService.getAllShips(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (ctx, index) {
                          return CardShip(
                              shipEntitie: snapshot.data![index],
                              onTap: () {
                                _shipsController?.model.update(ship_id: snapshot.data![index].shipId);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DetailShipPage()),
                                );
                              });
                        },
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
