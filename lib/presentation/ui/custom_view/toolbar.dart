import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../resource/colors/app_colors.dart';

class Toolbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool? isCloseButton;

  const Toolbar({Key? key, this.title = '', this.isCloseButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: AppColors.black),
        overflow: TextOverflow.ellipsis,
      ),
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: isCloseButton != null ? IconButton(
        icon: Icon(
          isCloseButton! ? Icons.close : Icons.arrow_back,
          color: AppColors.black,
        ),
        onPressed: () {
          AutoRouter.of(context).pop();
        },
      ) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
