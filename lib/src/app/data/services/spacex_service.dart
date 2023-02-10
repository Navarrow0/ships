
import 'package:momentum/momentum.dart';
import 'package:space_coding/src/app/data/entities/ship_entitie.dart';
import 'package:space_coding/src/app/domain/api.dart';

class SpaceXService extends MomentumService {
  static SpaceXService? _instance;

  factory SpaceXService() => _instance ??= SpaceXService._();

  SpaceXService._();

  Future<List<ShipEntitie>> getAllShips() async {
    final response = await Api().dio.get('ships');

    return (response.data as List)
        .map((p) => ShipEntitie.fromJson(p))
        .toList();
  }

  Future<ShipEntitie> getOneShip({required String shipId}) async {
    final response = await Api().dio.get('ships/$shipId');

    return ShipEntitie.fromJson(response.data);
  }
}
