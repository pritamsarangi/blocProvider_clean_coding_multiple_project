import 'package:blocprovider_clean_coding/models/user/user_model.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_repository.dart';



class LoginMockApiRepository implements LoginRepository{
  @override
  Future<UserModel> loginApi(dynamic data) async {
     await Future.delayed(const Duration(seconds: 2));
     final response = {
       'token' : 'sdf23eaxkj23'
     };
    return UserModel.fromJson(response);


  }
}