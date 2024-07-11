import 'dart:convert';

/// Converts a dynamic data to a JSON string.
/// This method ensures that the data is directly encodable.
String toJson(dynamic data) {
  const je = JsonEncoder.withIndent('  ');
  if (data == null) {
    return 'null';
  } else if (data is String || data is num || data is bool || data is List || data is Map) {
    // Data types that are directly encodable to JSON
    return je.convert(data);
  } else {
    // For types that are not directly encodable, return a default message
    return '{"error": "Data type not directly encodable to JSON"}';
  }
}

/// Converts a Map to a JSON string.
String map2Json(Map<dynamic, dynamic>? map) {
  if (map == null) {
    return 'null';
  }

  const je = JsonEncoder.withIndent('  ');
  return je.convert(map);
}
