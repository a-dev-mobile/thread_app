///Требуемый класс возвращаемых данных
class ResOptions {
  ResOptions({
    this.id,
    this.data,
    this.statusCode,
    this.responseTime,
    this.duration,
    this.headers,
  });
  int? id;
  dynamic data;
  int? statusCode;
  DateTime? responseTime; //ms
  int? duration; //ms
  Map<String, List<String>>? headers;
}
