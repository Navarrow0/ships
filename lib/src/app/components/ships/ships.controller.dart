
import 'package:momentum/momentum.dart';
import 'ships.model.dart';

class ShipsController extends MomentumController<ShipsModel>{

  @override
  ShipsModel init() {
    return ShipsModel(this, );
  }

  void updateShipId(String ship_id){
    model.update(ship_id: ship_id);
  }
}