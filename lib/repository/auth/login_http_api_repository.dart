import 'package:blocprovider_clean_coding/models/user/user_model.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_repository.dart';

import '../../config/app_url.dart';
import '../../data/network/network_services.dart';

class LoginHttpApiRepository implements LoginRepository{
  final _api = NetworkServicesApi();
  @override
  Future<UserModel> loginApi(dynamic data) async {
    final response = await _api.postApi(AppUrl.loginApi, data);
    // print(response);
    // print('error$response');
    return UserModel.fromJson(response);


  }
}