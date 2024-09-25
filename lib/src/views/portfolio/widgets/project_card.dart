import 'package:design_test/config/themes.dart';
import 'package:design_test/src/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      height: 110.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.all(0),
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        elevation: 0,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
              child: Image.asset(
                project.image,
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      project.title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        height: 1.285,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              project.language,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 10.sp,
                                color: Colors.black,
                                height: 1.172,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Wrap(
                              children: [
                                Text(
                                  "${project.author.split(" ").first} ",
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 10.sp,
                                      color: lightForeground,
                                      height: 1.172),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Text(
                                  project.author
                                      .split(" ")
                                      .sublist(1)
                                      .join(" "),
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: lightForeground,
                                    height: 1.172,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 26.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            gradient: buttonGradient,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Center(
                            child: Text(
                              'A',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: Colors.white,
                                height: 1.172,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
