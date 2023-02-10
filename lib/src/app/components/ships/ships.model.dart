
import 'package:momentum/momentum.dart';
import 'ships.controller.dart';

class ShipsModel extends MomentumModel<ShipsController> {
  const ShipsModel(ShipsController controller, {this.ship_id})
      : super(controller);

  final String? ship_id;


  @override
  void update({
    String? ship_id
}) {
    ShipsModel(
      controller,
      ship_id: ship_id ?? this.ship_id
    ).updateMomentum();
  }
}
