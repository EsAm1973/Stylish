import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/Core/utils/app_text_style.dart';
import 'package:stylish/Features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:stylish/Features/home/presentation/manager/profile_cubit/profile_state.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: GestureDetector(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withValues(alpha: .1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.sort,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
        ),
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset('assets/images/logo.svg', height: 30.h, width: 30.w),
          const SizedBox(width: 8),
          Text(
            'Stylish',
            style: AppTextStyles.extraBold18.copyWith(
              color: const Color(0xFF4392F9),
            ),
          ),
        ],
      ),

      // 3. Profile Avatar (Right)
      actions: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: CircularProgressIndicator(),
              );
            } else if (state is ProfileSuccess) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CachedNetworkImage(
                  imageUrl: state.user.avatar,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Colors.transparent,
                    child: Padding(
                      padding: EdgeInsets.all(8.0.r),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 22.r,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: const Icon(Icons.person),
                  ),
                ),
              );
            } else if (state is ProfileFailure) {
              return const Center(child: Icon(Icons.error));
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
