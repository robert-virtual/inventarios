import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:inventarios/pages/add_item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:realm/realm.dart';
import 'package:share_plus/share_plus.dart';

import '../realm/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? opt;
  final realm = Realm(Configuration.local([Item.schema]));
  List<Item> items = List.empty();
  bool searching = false;
  @override
  Widget build(BuildContext context) {
    items = realm.all<Item>().toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Exportar a Excel"),
                onTap: () async {
                  var excel = Excel
                      .createExcel(); // automatically creates 1 empty sheet: Sheet1
                  Sheet sheetObject = excel['Sheet1'];
                  var cell = sheetObject.cell(CellIndex.indexByString('A1'));
                  for (var e in items) {
                    sheetObject.insertRowIterables([
                      e.lugar,
                      e.fecha,
                      e.paca,
                      e.clase,
                      e.variedad,
                      e.detalle,
                      e.tamano,
                      e.corte,
                      e.libras
                    ], 2);
                  }
                  var fileBytes = excel.save();
                  var directory = await getExternalStorageDirectory();
                  if (directory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Error al guardar archivo"),
                      ),
                    );
                    return;
                  }
                  if (fileBytes != null) {
                    String filename =
                        "${directory.path}/inventario-${DateTime.now().toIso8601String()}.xlsx";
                    File file = File(filename)
                      ..createSync(recursive: true)
                      ..writeAsBytesSync(fileBytes);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Archivo guardado"),
                      ),
                    );

                    Share.shareXFiles([XFile(filename)]);
                  }
                },
              ),
            ],
          )
        ],
      ),
      body: items.isEmpty
          ? const Center(child: Text("No hay informacion aun"))
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, idx) {
                Item item = items[idx];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Paca: ${items[idx].paca}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Clase: ${item.clase}"),
                        Text("Lugar: ${item.lugar}"),
                        Text("Variedad: ${item.variedad}"),
                        Text("Detalle: ${item.detalle}"),
                        Text("Tamaño: ${item.tamano.toString()}"),
                        Text("Corte: ${item.corte.toString()}"),
                        Text("Libras: ${item.libras.toString()}"),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
              MaterialPageRoute(builder: (ontext) => const AddItemPage()));
          setState(() {
            realm.refresh();
            items = realm.all<Item>().toList();
          });
        },
        tooltip: 'agregar nuevo item',
        child: const Icon(Icons.add),
      ),
    );
  }
}
