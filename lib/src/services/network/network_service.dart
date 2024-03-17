import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import '../../src.export.dart';

abstract class NetworkService{
  Future<Either<Failure, ValidResponse>> get({
    String baseUrl,
    String path,
    Map<String, String>? headers,
    Map<String, dynamic>? params = const {},
    String? userToken,
  });
  Future<Either<Failure, ValidResponse>> post({
    String baseUrl,
    String path,
    Map<String, String>? headers,
    Map<String, dynamic> body = const{},
    Map<String, dynamic>? params = const {},
    String? userToken,

  });
  Future<Either<Failure, ValidResponse>> uploadImage({
    String baseUrl,
    required String path,
    required File image,
  });
}

@LazySingleton(as: NetworkService)
class NetworkServiceImpl with NetworksLogs implements NetworkService {
  final Map<String, String> _headers = {
    "Accept": "application/json",
  };
  final Map<String, dynamic> _params = {
    "lang":"en"
  };




  @override
  Future<Either<Failure, ValidResponse>> get({
    String baseUrl =NetworkConstants.baseUrl,
    String path = '',
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    String? userToken,

  }) async {
    try {
      final uri = Uri.https(baseUrl, path, params);
      if (!uri.isAbsolute) throw Exception('Not valid URL');
      final response = await http.get(uri, headers: _headers);
      final data = jsonDecode(response.body);
      final str = utf8.decode(response.bodyBytes);
      _networkLog(response, 'null');
      return Right(
        ValidResponse(
          statusCode: response.statusCode,
          data: json.decode(str),
          message: data['error'] ?? '',
          status: data['status'] ?? false,
        ),
      );
    } on SocketException catch (e) {
      return Left(Failure(statusCode: 500, message: e.message));
    } on ValidResponse catch (e) {
      return Right(ValidResponse(statusCode: e.statusCode, data: e.data, message: e.message,status: e.status));
    } on Exception catch (e) {
      return Left(Failure(statusCode: 500, message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ValidResponse>> post({
      String baseUrl = NetworkConstants.baseUrl,
      String path = '',
      Map<String, String>? headers,
      Map<String, dynamic> body = const{},
      Map<String, dynamic>? params,
      String? userToken,
      }) async{
    try {
      final uri = Uri.https(baseUrl, path, params);
      if (!uri.isAbsolute) throw Exception('Not valid URL');
      final response = await http.post(uri, headers: _headers,body: body);
      final data = jsonDecode(response.body);
      final str = utf8.decode(response.bodyBytes);
      _networkLog(response, body.toString());
      return Right(
        ValidResponse(
          statusCode: response.statusCode,
          data: json.decode(str),
          message: data['error'] ?? '',
          status: data['status'] ?? false,
        ),
      );
    } on SocketException catch (e) {
      return Left(Failure(statusCode: 500, message: e.message));
    } on ValidResponse catch (e) {
      return Right(ValidResponse(statusCode: e.statusCode, data: e.data, message: e.message,status: e.status));
    } on Exception catch (e) {
      return Left(Failure(statusCode: 500, message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, ValidResponse>> uploadImage({
    String baseUrl = NetworkConstants.baseUrl,
    required String path,
    required File image,
  }) async {
    try{
    Map<String,dynamic> data ={};
    final url = Uri.https(baseUrl,path);
    var request = http.MultipartRequest('POST', url);
    var stream = http.ByteStream(image.openRead());
    var length = await image.length();
    String fileName = image.path.split("/").last;
    fileName = fileName.replaceAll(" ", "_").replaceAll('-', "_").replaceAll('\'', '_').replaceAll('"', "_");
    var multipartFile = http.MultipartFile('photo', stream, length, filename: fileName);
    request.files.add(multipartFile);
    var response = await request.send();
    var responseData = await response.stream.transform(utf8.decoder).join();
    data = jsonDecode(responseData);
    _multiPartLog(response,data.toString());
    return Right(
      ValidResponse(
        statusCode: response.statusCode,
        data: data['data'],
        message: data['error'] ?? '',
        status: data['status'] ?? false,
      ),
    );
    } on SocketException catch (e) {
      return Left(Failure(statusCode: 500, message: e.message));
    } on ValidResponse catch (e) {
      return Right(ValidResponse(statusCode: e.statusCode, data: e.data, message: e.message,status: e.status));
    } on Exception catch (e) {
      return Left(Failure(statusCode: 500, message: e.toString()));
    }
  }

  void _requestHandler(
      Map<String, String>? headers,
      Map<String,dynamic>? params,
      String? userToken,
      ) {
    if (headers != null) _headers.addAll(headers);
    if (params != null) _params.addAll(params);
    if (userToken != null) _headers.addAll({"Authorization": " Bearer $userToken"});
  }



}
mixin NetworksLogs{
  void _networkLog(http.Response response,String body) =>
      developer.log('-----------------------------------------------\n'
          '|Http [RESPONSE] info ==> \n'
          '|ENVIRONMENT: \n'
          '|BASE_URL: https://${response.request!.url.authority}\n'
          '|PATH: ${response.request!.url.path}\n'
          '|FULL_URL: ${response.request!.url}\n'
          '|Method: ${response.request!.method}\n'
          '|Params: ${response.request!.url.queryParameters}\n'
          '|Host: ${response.request!.url.host}\n'
          '|statusCode: ${response.statusCode}\n'
          '|Scheme: ${response.request!.url.scheme}\n'
          '|Body: $body\n'
          '|RESPONSE:${jsonDecode(response.body)}\n'
          '|Header: ${response.headers}\n'
          '|[END] -----------------------------------------------\n\n');

  void _multiPartLog(StreamedResponse response,String body) =>
      developer.log('-----------------------------------------------\n'
          '- Http [RESPONSE] info ==> \n'
          '- ENVIROMENT: \n'
          '- BASE_URL: https://${response.request!.url.authority}\n'
          '- PATH: ${response.request!.url.path}\n'
          '- FULL_URL: ${response.request!.url}\n'
          '- Method: ${response.request!.method}\n'
          '- Params: ${response.request!.url.queryParameters}\n'
          '- Host: ${response.request!.url.host}\n'
          '- statusCode: ${response.statusCode}\n'
          '- Scheme: ${response.request!.url.scheme}\n'
          '- Body: ${response.request!.url.data}\n'
          '- Header: ${response.headers}\n'
          '- RESPONSE:$body\n'
          '- [END] -----------------------------------------------\n');


  void traceError(http.Response response,String body) =>
      developer.log('🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫\n'
          '| Http [ERROR] info ==> \n'
          '| ENVIRONMENT: \n'
          '| BASE_URL: https://${response.request!.url.authority}\n'
          '| PATH: ${response.request!.url.path}\n'
          '| FULL_URL: ${response.request!.url}\n'
          '| Method: ${response.request!.method}\n'
          '| Params: ${response.request!.url.queryParameters}\n'
          '| Host: ${response.request!.url.host}\n'
          '| statusCode: ${response.statusCode}\n'
          '| Scheme: ${response.request!.url.scheme}\n'
          '| Body: $body\n'
          '| Header: ${response.headers}\n'
          '| RESPONSE: ${response.body} \n'
          '| [END] 🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫🚫\n\n');
}