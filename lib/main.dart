import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:momentum/momentum.dart';
import 'package:space_coding/app.dart';
import 'package:space_coding/src/app/components/ships/index.dart';
import 'package:space_coding/src/app/data/services/spacex_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.prod");
  runApp( momentum());
}

Momentum momentum() {
  return Momentum(
    controllers: [
      ShipsController()
    ],
    services: [
      SpaceXService()
    ],
    child: const SpaceApp(),
    // and more optional parameters here.
  );
}