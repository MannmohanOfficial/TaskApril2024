import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_list/app/modules/home/controllers/home_controller.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder<HomeController>(
        builder: (homeController) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 136.0.h,
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
                      padding: EdgeInsets.all(12.0),
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
              Positioned(
                top: 125.0,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      height: 105.0.h,
                      width: 105.0.w,
                      decoration: BoxDecoration(
                        color: Color(0xFF304FFF).withOpacity(.5),
                        shape: BoxShape.circle,
                        border: Border.all(
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.white,
                          width: 5
                        )
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Text(
                      '${homeController.userData.name}',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.0
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 220.0.h,
                padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 18.0.h),
                decoration: BoxDecoration(
                  border: Border.all(
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: const Color(0xFFE6E9FF)
                  ),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.0.h,
                          width: 40.0.w,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF304FFF).withOpacity(.11),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/Envelope.png',

                          ),
                        ),
                        SizedBox(width: 11.0.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),
                            ),
                            Text(
                              '${homeController.userData.email}',
                              style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40.0.h,
                          width: 40.0.w,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF304FFF).withOpacity(.11),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/GenderIntersex.png',

                          ),
                        ),
                        SizedBox(width: 11.0.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              '${homeController.userData.gender}',
                              style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40.0.h,
                          width: 40.0.w,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Color(0xFF304FFF).withOpacity(.11),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/Envelope.png',

                          ),
                        ),
                        SizedBox(width: 11.0.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),
                            ),
                            Text(
                              '${homeController.userData.email}',
                              style: GoogleFonts.inter(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ).paddingOnly(top: 281.0.h, left: 18.0.w, right: 18.0.w)
            ],
          );
        }
      ),
    );
  }
}
