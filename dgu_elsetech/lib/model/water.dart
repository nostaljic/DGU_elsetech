class WaterMap {
  String location;
  int turbidity;
  int chlorine;
  int ph;

  WaterMap(
      {required this.location,
      required this.turbidity,
      required this.chlorine,
      required this.ph});

  WaterMap.fromMap(Map<String, dynamic> map)
      : location = map['location'],
        turbidity = map['turbidity'],
        chlorine = map['chlorine'],
        ph = map['ph'];
}
