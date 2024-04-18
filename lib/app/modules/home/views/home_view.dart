import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_list/app/modules/details/views/details_view.dart';
import 'package:user_list/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              height: 136.0.h,
              decoration: const BoxDecoration(
                color: Color(0xFF304FFF),
              ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: const Color(0xFF304FFF).withOpacity(0.11),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/icons/Users.png',
                        ).paddingSymmetric(
                            horizontal: 10.0.w, vertical: 10.0.h),
                      ),
                      SizedBox(width: 8.0.w),
                      Text(
                        'Users List',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        )),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      homeController.loadUserList();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/ArrowClockwise.png',
                          height: 20.h,
                          width: 20.w,
                        ).paddingSymmetric(horizontal: 10.0.w, vertical: 10.0.h),
                        Text(
                          'Load User Data',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF304FFF),
                          )),
                        )
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 12.0.w, vertical: 13.0.h),
            ).paddingOnly(top: 97.0.h, left: 18.0.w, right: 18.0.w),
            Text(
              'No of Users',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF909090),
              )),
            ).paddingOnly(top: 196.0.h, left: 18.0.w, right: 18.0.w),
            Obx(
              () {
               return SizedBox(
                 height: 601.0.h,
                 child: SingleChildScrollView(
                   child: Column(
                     children: [
                       ...List.generate(
                         homeController.users.length,
                             (index) {
                           return Column(
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     height: 45.h,
                                     width: 45.w,
                                     decoration: BoxDecoration(
                                       shape: BoxShape.circle,
                                       color:
                                       const Color(0xFF304FFF).withOpacity(.11),
                                     ),
                                   ),
                                   SizedBox(width: 15.0.w),
                                   Text(
                                     '${homeController.users[index].name}',
                                     style: GoogleFonts.poppins(
                                       textStyle: const TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   InkWell(
                                     onTap: () {},
                                     child: Container(
                                       height: 32.0.h,
                                       width: 75.0.w,
                                       padding: const EdgeInsets.all(8.0),
                                       decoration: BoxDecoration(
                                         border: Border.all(
                                           color: const Color(0xFF304FFF)
                                               .withOpacity(.10),
                                         ),
                                         borderRadius: BorderRadius.circular(5.0),
                                       ),
                                       child: Row(
                                         children: [
                                           Image.asset(
                                             'assets/icons/PencilSimple.png',
                                             height: 16.0.h,
                                             width: 16.0.w,
                                           ),
                                           SizedBox(width: 10.0.w),
                                           Text(
                                             'Edit',
                                             style: GoogleFonts.poppins(
                                                 fontWeight: FontWeight.normal,
                                                 fontSize: 14,
                                                 color: Colors.black.withOpacity(.65)
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 15.0.w),
                                   InkWell(
                                     onTap: () {
                                       homeController.getUserdata(homeController.users[index].id);
                                     },
                                     child: Container(
                                       height: 32.0.h,
                                       width: 75.0.w,
                                       padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical:8.0.h ),
                                       decoration: BoxDecoration(
                                         border: Border.all(
                                           color: const Color(0xFF304FFF)
                                               .withOpacity(.10),
                                         ),
                                         borderRadius: BorderRadius.circular(5.0),
                                       ),
                                       child: Row(
                                         children: [
                                           Image.asset(
                                             'assets/icons/Eye.png',
                                             height: 16.0.h,
                                             width: 16.0.w,
                                           ),
                                           SizedBox(width: 10.0.w),
                                           Text(
                                             'View',
                                             style: GoogleFonts.poppins(
                                                 fontWeight: FontWeight.normal,
                                                 fontSize: 14,
                                                 color: Colors.black.withOpacity(.65)
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                   SizedBox(width: 15.0.w),
                                   Container(
                                     height: 32.0.h,
                                     width: 96.0.w,
                                     padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 8.0.h),
                                     decoration: BoxDecoration(
                                       border: Border.all(
                                         color: const Color(0xFF304FFF)
                                             .withOpacity(.10),
                                       ),
                                       borderRadius: BorderRadius.circular(5.0),
                                     ),
                                     child: Row(
                                       children: [
                                         Image.asset(
                                           'assets/icons/Trash.png',
                                           height: 16.0.h,
                                           width: 16.0.w,
                                         ),
                                         SizedBox(width: 10.0.w),
                                         Text(
                                           'Delete',
                                           style: GoogleFonts.poppins(
                                               fontWeight: FontWeight.normal,
                                               fontSize: 14,
                                               color: Colors.black.withOpacity(.65)
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ],
                               ).paddingOnly(left: 61.0),
                               SizedBox(height: 12.0.h),
                               Divider(
                                 color: Colors.grey.withOpacity(.5),
                               ),
                             ],
                           );
                         },
                       ),
                       SizedBox(height: 24.0.h),
                       InkWell(
                         onTap: () {
                           homeController.loadMore();
                         },
                         child: Center(
                           child: Container(
                             width: 105.0.w,
                             height: 38.0.h,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(4.0),
                               color: Color(0xFF304FFF).withOpacity(.11),
                             ),
                             padding: EdgeInsets.all(8.0),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Image.asset(
                                   'assets/icons/Spinner.png',
                                   height: 20.0.h,
                                   width: 20.0.w,
                                 ),
                                 SizedBox(width: 8.0.w),
                                 Text(
                                   'Load More',
                                   style: GoogleFonts.poppins(
                                       fontSize: 12.0,
                                       fontWeight: FontWeight.normal,
                                       color: Color(0xFF304FFF)
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 24.0.h),
                     ],
                   ),
                 ),
               ).paddingOnly(top: 243.0.h, left: 18.0.w, right: 18.0.w);
              },
            )
          ],
        ),
      );
    });
  }
}
