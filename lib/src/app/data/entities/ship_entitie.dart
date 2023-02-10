class ShipEntitie {
  ShipEntitie({
    required this.shipId,
    required this.shipName,
    this.shipModel,
    required this.shipType,
    required this.roles,
    required this.active,
    this.imo,
    this.mmsi,
    this.abs,
    this.shipEntitieClass,
    this.weightLbs,
    this.weightKg,
    this.yearBuilt,
    required this.homePort,
    this.status,
    this.speedKn,
    this.courseDeg,
    required this.position,
    this.successfulLandings,
    this.attemptedLandings,
    required this.missions,
    this.url,
    this.image,
  });

  String shipId;
  String shipName;
  String? shipModel;
  String shipType;
  List<String> roles;
  bool active;
  int? imo;
  int? mmsi;
  int? abs;
  int? shipEntitieClass;
  int? weightLbs;
  int? weightKg;
  int? yearBuilt;
  String homePort;
  String? status;
  double? speedKn;
  int? courseDeg;
  Position position;
  int? successfulLandings;
  int? attemptedLandings;
  List<Mission> missions;
  String? url;
  String? image;

  factory ShipEntitie.fromJson(Map<String, dynamic> json) => ShipEntitie(
    shipId: json["ship_id"],
    shipName: json["ship_name"],
    shipModel: json["ship_model"],
    shipType: json["ship_type"],
    roles: List<String>.from(json["roles"].map((x) => x)),
    active: json["active"],
    imo: json["imo"],
    mmsi: json["mmsi"],
    abs: json["abs"],
    shipEntitieClass: json["class"],
    weightLbs: json["weight_lbs"],
    weightKg: json["weight_kg"],
    yearBuilt: json["year_built"],
    homePort: json["home_port"],
    status: json["status"],
    speedKn: json["speed_kn"]?.toDouble(),
    courseDeg: json["course_deg"],
    position: Position.fromJson(json["position"]),
    successfulLandings: json["successful_landings"],
    attemptedLandings: json["attempted_landings"],
    missions: List<Mission>.from(json["missions"].map((x) => Mission.fromJson(x))),
    url: json["url"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "ship_id": shipId,
    "ship_name": shipName,
    "ship_model": shipModel,
    "ship_type": shipType,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "active": active,
    "imo": imo,
    "mmsi": mmsi,
    "abs": abs,
    "class": shipEntitieClass,
    "weight_lbs": weightLbs,
    "weight_kg": weightKg,
    "year_built": yearBuilt,
    "home_port": homePort,
    "status": status,
    "speed_kn": speedKn,
    "course_deg": courseDeg,
    "position": position.toJson(),
    "successful_landings": successfulLandings,
    "attempted_landings": attemptedLandings,
    "missions": List<dynamic>.from(missions.map((x) => x.toJson())),
    "url": url,
    "image": image,
  };
}

class Mission {
  Mission({
    required this.name,
    required this.flight,
  });

  String name;
  int flight;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    name: json["name"],
    flight: json["flight"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "flight": flight,
  };
}

class Position {
  Position({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

