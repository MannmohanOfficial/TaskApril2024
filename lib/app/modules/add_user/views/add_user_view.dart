import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_list/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_user_controller.dart';

class AddUserView extends GetView<AddUserController> {
  const AddUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: InkWell(
        onTap: () {
          homeController.addUser();
        },
        child: Container(
          height: 50.0.h,
          decoration: BoxDecoration(
              color: const Color(0xFF304FFF),
              borderRadius: BorderRadius.circular(4.0.dm)),
          child: Center(
            child: Text(
              'Create User',
              style: GoogleFonts.inter(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ).paddingOnly(left: 18.0.w, right: 18.0.w, bottom: 18.0.h),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 167.0.h,
            decoration: const BoxDecoration(
              color: Color(0xFF304FFF),
            ),
          ),
          InkWell(
            onTap: () => Get.back(),
            child: Row(
              children: [
                Container(
                  height: 40.0.h,
                  width: 40.0.w,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/Vector.png',
                    width: 16.0,
                  ),
                ),
                SizedBox(width: 8.0.w),
                Text(
                  'Back',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ).paddingOnly(top: 63.0.h, left: 18.0.w),
          ),
          Container(
            height: 74.0.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0.dm),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF304FFF).withOpacity(0.11),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF304FFF).withOpacity(0.11),
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icons/Users.png',
                  ).paddingSymmetric(horizontal: 10.0.w, vertical: 10.0.h),
                ),
                SizedBox(width: 8.0.w),
                Text(
                  'Add User',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  )),
                )
              ],
            ).paddingSymmetric(horizontal: 12.0.w, vertical: 13.0.h),
          ).paddingOnly(top: 130.0.h, left: 18.0.w, right: 18.0.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(height: 8.0.h),
              TextFormField(
                controller: homeController.userNameController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                ),
              ),
              SizedBox(height: 8.0.h),
              Text(
                "Email",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(height: 8.0.h),
              TextFormField(
                controller: homeController.userEmailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                ),
              ),
              SizedBox(height: 8.0.h),
              Text(
                "Gender",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(height: 8.0.h),
              TextFormField(
                controller: homeController.userGenderController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                ),
              ),
              SizedBox(height: 8.0.h),
              Text(
                "Status",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(height: 8.0.h),
              TextFormField(
                controller: homeController.userStatusController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFC5C6CC),
                    ), //<-- SEE HERE
                  ),
                ),
              ),
            ],
          ).paddingOnly(top: 236.0.h, left: 18.0.w, right: 18.0.w)
        ],
      ),
    );
  }
}
