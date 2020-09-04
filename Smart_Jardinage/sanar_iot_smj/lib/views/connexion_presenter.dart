import 'package:sanar_iot_smj/db/rest_data.dart';
import 'package:sanar_iot_smj/models/user.dart';

abstract class ConnexionContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);
}

class ConnexionPresenter{
  ConnexionContract _view ;
  RestData api = new RestData();
  ConnexionPresenter(_view);
  doLogin(String username,String password){
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError)=>_view.onLoginError(onError));
  }
}