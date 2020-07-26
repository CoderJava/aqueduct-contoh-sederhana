import 'dart:convert';

import 'package:contoh_sederhana/contoh_sederhana.dart';
import 'package:contoh_sederhana/pengguna.dart';

class PenggunaController extends ResourceController {
  final ManagedContext context;

  PenggunaController(this.context);

  @Operation.get()
  Future<Response> getAllPengguna() async {
    final listPengguna = await Query<Pengguna>(context).fetch();
    return Response.ok(
      {
        'data': listPengguna.map((e) => e.asMap()).toList(),
      },
    );
  }

  @Operation.post()
  Future<Response> createPengguna(@Bind.body() Pengguna inputPengguna) async {
    final query = Query<Pengguna>(context)..values = inputPengguna;
    final insertedPengguna = await query.insert();
    return Response.ok(insertedPengguna);
  }

  @Operation.put('id')
  Future<Response> updatePengguna(@Bind.path('id') int id, @Bind.body() Pengguna inputPengguna) async {
    final query = Query<Pengguna>(context)
      ..where((element) => element.id).equalTo(id)
      ..values.name = inputPengguna.name
      ..values.email = inputPengguna.email;
    final updatedPengguna = await query.updateOne();
    if (updatedPengguna == null) {
      return Response.notFound();
    }
    return Response.ok(updatedPengguna);
  }

  @Operation.delete('id')
  Future<Response> deletePenggunaById(@Bind.path('id') int id) async {
    final query = Query<Pengguna>(context)..where((element) => element.id).equalTo(id);
    final deletedPengguna = await query.delete();
    if (deletedPengguna > 0) {
      return Response.ok({'message': 'Deleted successfully'});
    }
    return Response.notFound();
  }
}
