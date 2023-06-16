import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
   try{
     final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
     responseJson = returnResponse(response);
   }on SocketException{
     throw FetchDataException('No Interest Connection');
   }
   return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try{
      final response = await http.post(
          Uri.parse(url),
          body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }on SocketException{
      throw FetchDataException('No Interest Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){

      case 200 :
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400 :
        throw BadRequestException(response.statusCode.toString());

      case 500 :
        throw BadRequestException(response.statusCode.toString());

      case 404 :
        throw UnauthorisedException(response.statusCode.toString());

      default  :
        throw FetchDataException("Error occured while comminicating with server with status code: " + response.statusCode.toString());
    }
  }
  
}