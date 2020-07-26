import 'package:contoh_sederhana/contoh_sederhana.dart';

class ExampleController extends ResourceController {
  @Operation.get()
  Future<Response> getExample() async {
    return Response.ok({'data': 'Endpoint GET berhasil'});
  }

  @Operation.post()
  Future<Response> postExample() async {
    return Response.created('1', body: {'data': 'Endpoint POST berhasil'});
  }

  @Operation.put()
  Future<Response> putExample() async {
    return Response.ok({'data': 'Endpoint PUT berhasil'});
  }

  @Operation.delete()
  Future<Response> deleteExample() async {
    return Response.ok({'data': 'Endpoint DELETE berhasil'});
  }
}