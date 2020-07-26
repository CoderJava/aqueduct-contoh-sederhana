import 'package:contoh_sederhana/contoh_sederhana.dart';

class Pengguna extends ManagedObject<_Pengguna> implements _Pengguna {}

class _Pengguna {
  @primaryKey
  int id;
  @Column(unique: true)
  String email;
  @Column(unique: true)
  String name;
}