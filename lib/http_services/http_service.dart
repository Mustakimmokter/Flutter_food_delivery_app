import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpService {

  static String baseUrl = dotenv.get('BASE_URL');

  static Map<String, dynamic> commonHeaders() => {'Accept-Language': 'en'};

  static BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,connectTimeout: 1000,receiveTimeout: 1000,);

  static Dio dio = Dio(baseOptions)..interceptors.add(initializeInterceptors());


  static Future<Response<dynamic>> getUser(String endPoint)async{




    try {
      final response = await dio.get<String>(
        endPoint,
        options: Options(
          headers: commonHeaders(),
        ));


      return response;
    } on DioError catch (err) {
      print(err.message);
      throw Exception(err.message);
    }
  }

 static InterceptorsWrapper initializeInterceptors(){
  return InterceptorsWrapper(
     onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
       print('request: ${options.data} path: ${options.path}');

     },

     onResponse: (Response<dynamic> response, ResponseInterceptorHandler handler) {
       print('Response: ${response.statusCode} Path: ${response.requestOptions.path}');
     },

     onError: (DioError err, ErrorInterceptorHandler handler) {
       print('Error: ${err.response!.statusCode} Path: ${err.requestOptions.path}');
     },


   );
 }
}
