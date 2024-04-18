import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:user_list/app/data/models/user_model.dart';
import 'package:user_list/app/data/services/user_repository.dart';
import 'package:user_list/app/modules/details/views/details_view.dart';
import 'package:user_list/app/modules/edit/views/edit_view.dart';
import 'package:user_list/app/modules/home/views/home_view.dart';
import 'package:user_list/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final pageCount = 0.obs;
  final perPage = 5.obs;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController statusController;

  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();
  TextEditingController userStatusController = TextEditingController();

  @override
  void onInit() {
    log('Home Controller called');
    nameController = TextEditingController();
    emailController = TextEditingController();
    genderController = TextEditingController();
    statusController = TextEditingController();
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

  Future<void> editUserdata(userId) async {
    userRepository.getUserDetails(userId).then(
      (value) {
        if (value != null) {
          userData = UserModel.fromJson(value.responseBody);
          nameController.text = userData.name!;
          emailController.text = userData.email!;
          genderController.text = userData.gender!;
          statusController.text = userData.status!;
          update();
          Get.to(
            () => const EditView(),
          );
        }
      },
    );
  }

  Future<void> getUserdata(userId) async {
    userRepository.getUserDetails(userId).then(
      (value) {
        if (value != null) {
          userData = UserModel.fromJson(value.responseBody);
          nameController.text = userData.name!;
          emailController.text = userData.email!;
          genderController.text = userData.gender!;
          statusController.text = userData.status!;
          Get.to(
            () => const DetailsView(),
          );
        }
      },
    );
  }

  Future<void> updateUser(userId) async {
    userRepository
        .updateUserDetails(
      userId,
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      gender: genderController.text.trim(),
      status: statusController.text.trim(),
    )
        .then(
      (value) {
        if (value != null && value.responseCode == 200) {
          Get.snackbar(
              'Successfully Updated!', 'Profile updated successfully!');
          Get.offAll(() => const HomeView());
        }
      },
    );
  }

  Future<void> deleteUser(userId) async {
    userRepository.deleteUser(userId).then(
      (value) {
        if (value != null && value.responseCode == 204) {
          Get.snackbar(
              'Successfully Deleted!', 'Profile deleted successfully!');
          fetchUserList();
        }
      },
    );
  }

  Future<void> addUser() async {
    userRepository
        .addUserDetails(
      name: userNameController.text.trim(),
      email: userEmailController.text.trim(),
      gender: userGenderController.text.trim(),
      status: userStatusController.text.trim(),
    )
        .then(
      (value) {
        if (value != null && value.responseCode == 201) {
          Get.snackbar('Added Updated!', 'Profile added successfully!');
          fetchUserList();
          Get.offAll(() => const HomeView());
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
