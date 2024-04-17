import 'package:user_list/app/data/provider/api_endpoints.dart';
import 'package:user_list/app/data/provider/api_provider.dart';

class UserRepository {
  static final _singleton = UserRepository();
  static UserRepository get instance => _singleton;

  Future<AppResponse?> getUserList(int page, int perPage) async {
    return await APIProvider.instance.get('${APIEndpoints.userList}page=$page&per_page=$perPage');
  }
}
