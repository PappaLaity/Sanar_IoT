import 'package:sanar_iot_smj/models/user.dart';
import 'package:sanar_iot_smj/utils/network_util.dart';

class RestData{
  NetworkUtil _netutil = new NetworkUtil();
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL+"/";

  Future <User> login(String username , String password){
    return null;
  }
}