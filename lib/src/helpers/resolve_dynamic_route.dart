import 'dart:io';
import '../globals/typedefs.dart';
import 'resolve_method.dart';
import 'dynamic_route_to_values.dart';
import 'dynamic_route_is_valid.dart';

Future<void> resolveDynamicRoute(
    HttpRequest request, String dynamicRoute) async {
  if (!dynamicRouteIsValid(request, dynamicRoute)) {
    request.response.statusCode = HttpStatus.notFound;
    return request.response.write(HTTP_NOT_FOUND);
  }

  final mappedValues = dynamicRouteToValues(request, dynamicRoute);

  if (mappedValues.isEmpty) {
    request.response.statusCode = HttpStatus.notFound;
    return request.response.write(HTTP_NOT_FOUND);
  }

  await resolveMethod(request, mappedValues, dynamicRoute);
}
