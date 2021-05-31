import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../router/app_router.gr.dart';
import '../base/base_state_and_utils.dart';
import 'edit_profile_bloc.dart';
import 'profile_shared_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseState<EditProfileScreen, EditProfileBloc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<int>(
              stream: context.read<ProfileSharedBloc>().streamData,
              builder: (context, snapshot) {
                return Text('data ${snapshot.data}');
              }),
          ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(const GalleryScreenRoute());
            },
            child: const Text('Go to gallery'),
          ),
          ElevatedButton(
            onPressed: () => context.read<ProfileSharedBloc>().setData(0),
            child: const Text('clear data'),
          ),
        ],
      ),
    );
  }
}
