import 'package:basecleanflutter/presentation/ui/custom_view/view_group/toolbar.dart';

import '../../navigation/navigator/app_navigator.dart';
import '../gallery/gallery_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state_and_utils.dart';
import 'edit_profile_bloc.dart';
import 'profile_shared_bloc.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen();

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseState<EditProfileScreen, EditProfileBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: 'Edit profile', isCloseButton: false),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<int>(
                stream: context.read<ProfileSharedBloc>().streamData,
                builder: (context, snapshot) {
                  return Text('data ${snapshot.data}');
                }),
            ElevatedButton(
              onPressed: () {
                AppNavigator.of(context).push(const GalleryScreen());
              },
              child: const Text('Go to gallery'),
            ),
            ElevatedButton(
              onPressed: () => context.read<ProfileSharedBloc>().setData(0),
              child: const Text('clear data'),
            ),
          ],
        ),
      ),
    );
  }
}
