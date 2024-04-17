import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:user_list/app/data/models/user_model.dart';
import 'package:user_list/app/data/services/user_repository.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final pageCount = 1.obs;
  final perPage = 5.obs;

  @override
  void onInit() {
    log('Home Controller called');
    fetchUserList();
    super.onInit();
  }

  final userRepository = UserRepository.instance;
  List<UserModel> user = <UserModel>[];

  Future<void> fetchUserList() async {
    // authRepository.getProfileForCountry().then((value) {
    //   if (value != null) {
    //     final response = value.responseBody;
    //     if (response != null) {
    //       user = UserProfile.fromJson(response['data']);
    //       QpString.verificationStatus = user.verificationStatus ?? '';
    //       QpString.currency = user.currencyIcon ?? "£";
    //       QpString.currencyCode = user.currency ?? "GBP";
    //       update();
    //     } else {
    //       EvContext.cxt.showErrorDialog(text: response["message"]);
    //     }
    //   } else {
    //     EvContext.cxt
    //         .showErrorDialog(text: value?.message ?? "something wrong!");
    //   }
    // });
    userRepository.getUserList(pageCount.value, perPage.value).then((value) {
      if (value != null) {
        final response = jsonEncode(value.responseBody);
        user = userModelFromJson(response);
        log("Type: ${response.runtimeType}");
        log("Length: ${user.length}");
      }
    });
  }
}
