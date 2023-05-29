import 'package:realm/realm.dart';

part 'item.g.dart';

@RealmModel()
class _Item {
  @PrimaryKey()
  late ObjectId id;

  late final String paca;
  late String clase;
  late String lugar;
  late String variedad;
  late String detalle;
  late int tamano;
  late int corte;
  late double libras;
  late DateTime fecha;
}
