import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nail_art/Bloc/BottomNavBloC/bottom_nav_bloc.dart';
import 'package:nail_art/Core/Constants/Assets.dart';
import 'package:nail_art/Screens/MainBottomNavigationScreen/Widgets/BottomNavItemWidget.dart';

class BottomNavBarWidget extends StatefulWidget {
  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    // context.read<BottomNavBloc>().add(
    //       BottomNavSelectItem(
    //         selectedInxdex: 0,
    //       ),
    //     );
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Container(
          height: 78.h,
          width: 1.sw,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage(bottomNavImage),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                        BottomNavSelectItem(
                          selectedInxdex: 0,
                        ),
                      );
                  // print((state as BottomNavSelectedIndex).selectedIndex);
                },
                child: BottomNavItemWidget(
                  index: 0,
                  title: 'Home',
                  icon: Icons.home,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                        BottomNavSelectItem(
                          selectedInxdex: 1,
                        ),
                      );
                },
                child: BottomNavItemWidget(
                  index: 1,
                  title: 'Favorites',
                  icon: Icons.favorite_border,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                        BottomNavSelectItem(
                          selectedInxdex: 2,
                        ),
                      );
                },
                child: BottomNavItemWidget(
                  index: 2,
                  title: 'My Courses',
                  icon: Icons.subject,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<BottomNavBloc>().add(
                        BottomNavSelectItem(
                          selectedInxdex: 3,
                        ),
                      );
                },
                child: BottomNavItemWidget(
                  index: 3,
                  title: 'Profile',
                  icon: Icons.person,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
