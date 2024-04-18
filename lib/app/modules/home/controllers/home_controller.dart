import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:user_list/app/data/models/user_model.dart';
import 'package:user_list/app/data/services/user_repository.dart';
import 'package:user_list/app/modules/details/views/details_view.dart';
import 'package:user_list/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final pageCount = 0.obs;
  final perPage = 5.obs;

  @override
  void onInit() {
    log('Home Controller called');
    super.onInit();
  }

  final userRepository = UserRepository.instance;
  RxList<UserModel> users = <UserModel>[].obs;
  var userData = UserModel();

  Future<void> fetchUserList() async {
    userRepository.getUserList(pageCount.value, perPage.value).then((value) {
      if (value != null) {
        final response = jsonEncode(value.responseBody);
        users(userModelFromJson(response));
        log("Type: ${response.runtimeType}");
        log("Length: ${users.length}");
      }
    });
  }

  Future<void> getUserdata(userId) async {
    userRepository.getUserDetails(userId).then(
      (value) {
        if (value != null) {
          userData = UserModel.fromJson(value.responseBody);
          Get.to(
              () => const DetailsView(),
          );
        }
      },
    );
  }

  void loadUserList() {
    if (pageCount.value == 0 && perPage.value == 5) {
      pageCount.value++;
      fetchUserList();
      update();
    } else {
      pageCount(1);
      fetchUserList();
      update();
    }
  }

  void loadMore() {
    if (pageCount.value != 0 && pageCount.value >= 1) {
      pageCount.value++;
      fetchUserList();
      update();
    }
    log("pageCount: $pageCount");
  }
}
