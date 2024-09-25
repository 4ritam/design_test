import 'package:design_test/config/themes.dart';
import 'package:design_test/src/controllers/project_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/project_card.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final ProjectController _projectController = ProjectController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        projectList(),
        filterButton(),
      ],
    );
  }

  Widget projectList() {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 16.w,
      ),
      children: [
        searchField(),
        SizedBox(height: 16.h),
        ..._searchController.text.isEmpty
            ? _projectController.getProjects().map(
                  (project) => ProjectCard(project: project),
                )
            : _projectController.searchProjects(_searchController.text).isEmpty
                ? [
                    Center(
                      child: Text(
                        'No project found',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ]
                : _projectController
                    .searchProjects(_searchController.text)
                    .map(
                      (project) => ProjectCard(project: project),
                    )
                    .toList(),
      ],
    );
  }

  Widget searchField() {
    return TextField(
      controller: _searchController,
      onChanged: (value) => {
        setState(() {}),
      },
      decoration: InputDecoration(
        hintText: 'Search a project',
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: lightForeground,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.h,
          vertical: 14.w,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: borderColor),
        ),
        filled: true,
        fillColor: Colors.white,
        suffixIcon: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.w,
          ),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.w,
            ),
            child: SvgPicture.asset(
              'assets/svgs/search_icon.svg',
              width: 10.w,
              height: 10.r,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Padding filterButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/svgs/filter_icon.svg',
                  width: 18,
                  height: 12,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
