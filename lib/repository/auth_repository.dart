import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/res/app_url.dart';
import '../data/network/BaseApiServices.dart';

class AuthRepository{

  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }


}