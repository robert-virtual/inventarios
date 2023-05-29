import 'package:flutter/material.dart';
import 'package:inventarios/realm/item.dart';
import 'package:realm/realm.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});
  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final paca = TextEditingController();
  String? lugar;
  final clase = TextEditingController();
  final variedad = TextEditingController();
  final detalle = TextEditingController();
  final tamano = TextEditingController();
  final corte = TextEditingController();
  final libras = TextEditingController();
  final preciolibras = TextEditingController();
  final fecha = TextEditingController(text: DateTime.now().toIso8601String());
  final costoLibra = TextEditingController();
  final config = Configuration.local([Item.schema]);

  @override
  Widget build(BuildContext context) {
    final realm = Realm(config);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const Text("Lugar"),
          DropdownButton<String?>(
              value: lugar,
              items: const [
                DropdownMenuItem(
                  value: "Mantenedor",
                  child: Text("Mantenedor"),
                ),
                DropdownMenuItem(
                  value: "Secadero",
                  child: Text("Secadero"),
                ),
                DropdownMenuItem(
                  value: "Bodega 19",
                  child: Text("Bodega 19"),
                ),
                DropdownMenuItem(
                  value: "Bodega 12",
                  child: Text("Bodega 12"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  if (value != null) lugar = value;
                });
              }),
          TextField(
            controller: paca,
            decoration: const InputDecoration(
              label: Text("Paca"),
            ),
          ),
          TextField(
            controller: clase,
            decoration: const InputDecoration(
              label: Text("Clase"),
            ),
          ),
          TextField(
            controller: variedad,
            decoration: const InputDecoration(
              label: Text("Variedad"),
            ),
          ),
          TextField(
            controller: detalle,
            decoration: const InputDecoration(
              label: Text("Detalle"),
            ),
          ),
          TextField(
            controller: tamano,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Tamaño"),
            ),
          ),
          TextField(
            controller: corte,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Corte"),
            ),
          ),
          TextField(
            controller: libras,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Libras"),
            ),
          ),
          TextField(
            controller: preciolibras,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text("Precio por Libras"),
            ),
          ),
          TextField(
            controller: fecha,
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.parse(fecha.text),
                firstDate: DateTime(2021),
                lastDate: DateTime(DateTime.now().year + 1),
              );
              if (picked != null) {
                setState(() {
                  fecha.text = picked.toIso8601String();
                });
              }
            },
            decoration: const InputDecoration(
              label: Text("Fecha"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final item = Item(
            ObjectId(),
            paca.text,
            clase.text,
            lugar!,
            variedad.text,
            detalle.text,
            int.parse(tamano.text),
            int.parse(corte.text),
            double.parse(libras.text),
            DateTime.parse(fecha.text),
          );
          realm.write(() {
            realm.add(item);
            Navigator.of(context).pop();
          });
        },
        tooltip: 'guardar nuevo item',
        child: const Icon(Icons.save),
      ),
    );
  }
}
