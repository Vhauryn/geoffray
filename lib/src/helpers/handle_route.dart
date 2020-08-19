import 'dart:io';
import '../globals/typedefs.dart';

void handleRoute(HandleMiddleware handleGuard, HandleReqRes handleRequest,
    HttpRequest request) {
  if (handleGuard != null && handleGuard(request, request.response))
    handleRequest(request, request.response);
  else if (handleGuard != null && !handleGuard(request, request.response))
    request.response.statusCode = HttpStatus.unprocessableEntity;
  else
    handleRequest(request, request.response);
}
