import 'package:thread/src/common/network/dio_log/bean/err_options.dart';
import 'package:thread/src/common/network/dio_log/bean/req_options.dart';
import 'package:thread/src/common/network/dio_log/bean/res_options.dart';


///Требуемые классы сетевых данных
class NetOptions {
  NetOptions({
    this.reqOptions,
    this.resOptions,
    this.errOptions,
  });
  ReqOptions? reqOptions;
  ResOptions? resOptions;
  ErrOptions? errOptions;
}

///Определите, являются ли возвращенные данные ненормальными
typedef ResError = bool Function(NetOptions res);
