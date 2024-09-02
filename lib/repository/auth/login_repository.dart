import 'package:blocprovider_clean_coding/models/user/user_model.dart';


abstract class LoginRepository {
  Future<UserModel> loginApi(dynamic data);
}