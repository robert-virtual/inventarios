// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Item extends _Item with RealmEntity, RealmObjectBase, RealmObject {
  Item(
    ObjectId id,
    String paca,
    String clase,
    String lugar,
    String variedad,
    String detalle,
    int tamano,
    int corte,
    double libras,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'paca', paca);
    RealmObjectBase.set(this, 'clase', clase);
    RealmObjectBase.set(this, 'lugar', lugar);
    RealmObjectBase.set(this, 'variedad', variedad);
    RealmObjectBase.set(this, 'detalle', detalle);
    RealmObjectBase.set(this, 'tamano', tamano);
    RealmObjectBase.set(this, 'corte', corte);
    RealmObjectBase.set(this, 'libras', libras);
  }

  Item._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get paca => RealmObjectBase.get<String>(this, 'paca') as String;
  @override
  set paca(String value) => throw RealmUnsupportedSetError();

  @override
  String get clase => RealmObjectBase.get<String>(this, 'clase') as String;
  @override
  set clase(String value) => RealmObjectBase.set(this, 'clase', value);

  @override
  String get lugar => RealmObjectBase.get<String>(this, 'lugar') as String;
  @override
  set lugar(String value) => RealmObjectBase.set(this, 'lugar', value);

  @override
  String get variedad =>
      RealmObjectBase.get<String>(this, 'variedad') as String;
  @override
  set variedad(String value) => RealmObjectBase.set(this, 'variedad', value);

  @override
  String get detalle => RealmObjectBase.get<String>(this, 'detalle') as String;
  @override
  set detalle(String value) => RealmObjectBase.set(this, 'detalle', value);

  @override
  int get tamano => RealmObjectBase.get<int>(this, 'tamano') as int;
  @override
  set tamano(int value) => RealmObjectBase.set(this, 'tamano', value);

  @override
  int get corte => RealmObjectBase.get<int>(this, 'corte') as int;
  @override
  set corte(int value) => RealmObjectBase.set(this, 'corte', value);

  @override
  double get libras => RealmObjectBase.get<double>(this, 'libras') as double;
  @override
  set libras(double value) => RealmObjectBase.set(this, 'libras', value);

  @override
  Stream<RealmObjectChanges<Item>> get changes =>
      RealmObjectBase.getChanges<Item>(this);

  @override
  Item freeze() => RealmObjectBase.freezeObject<Item>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Item._);
    return const SchemaObject(ObjectType.realmObject, Item, 'Item', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('paca', RealmPropertyType.string),
      SchemaProperty('clase', RealmPropertyType.string),
      SchemaProperty('lugar', RealmPropertyType.string),
      SchemaProperty('variedad', RealmPropertyType.string),
      SchemaProperty('detalle', RealmPropertyType.string),
      SchemaProperty('tamano', RealmPropertyType.int),
      SchemaProperty('corte', RealmPropertyType.int),
      SchemaProperty('libras', RealmPropertyType.double),
    ]);
  }
}
