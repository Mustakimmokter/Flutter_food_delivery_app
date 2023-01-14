
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app1/http_services/http_service.dart';
import 'package:flutter_food_app1/shared/models/profile/data.dart';

class ProfileProvider extends ChangeNotifier {

  final Data _data = Data();
  final bool _isTrue = true;

  bool get isTrue => _isTrue;
 Data get data => _data;

 Future<void> getUserProfile()async{
   print('............calling............');
   final response = await userProfile();
   print('............Successful............');
   print(response.statusCode);
   notifyListeners();

 }

  Future<Response<dynamic>> userProfile() async {

    final url = '${HttpService.baseUrl}/api/users/2';

   final response = await  HttpService.getUser(url);

   return response;

  }

}
