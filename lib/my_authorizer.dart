import 'contoh_sederhana.dart';

class MyAuthorizer extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    if (request.raw.headers.value('x-secret-key') == 'secret') {
      return request;
    }
    return Response.badRequest();
  }
}