import 'package:user_list/app/data/provider/api_endpoints.dart';
import 'package:user_list/app/data/provider/api_provider.dart';

class UserRepository {
  static final _singleton = UserRepository();
  static UserRepository get instance => _singleton;

  Future<AppResponse?> getUserList(int page, int perPage) async {
    return await APIProvider.instance.get('${APIEndpoints.userList}page=$page&per_page=$perPage');
  }

  Future<AppResponse?> addUserDetails( {required String name,
  required String email,
  required String gender,
  required String status,
}) async {
    return await APIProvider.instance.post(APIEndpoints.createUser, {
      'name': name,
      'email': email,
      'gender': gender,
      'status': status
    });
  }

  Future<AppResponse?> getUserDetails(userId) async {
    return await APIProvider.instance.get('${APIEndpoints.rudUsers}$userId');
  }

  Future<AppResponse?> updateUserDetails(userId, {required String name,
  required String email,
  required String gender,
  required String status,
}) async {
    return await APIProvider.instance.put('${APIEndpoints.rudUsers}$userId', {
      'name': name,
      'email': email,
      'gender': gender,
      'status': status
    });
  }

  Future<AppResponse?> deleteUser(userId) async {
    return await APIProvider.instance.delete('${APIEndpoints.rudUsers}$userId');
  }
}
