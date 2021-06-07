import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:provider/provider.dart';

import '../../../domain/entity/notification.dart';
import '../base/base_state_and_utils.dart';
import '../edit_profile/profile_shared_bloc.dart';
import 'gallery_bloc.dart';

class GalleryScreen extends StatefulWidget {
  final Notification? notification;

  const GalleryScreen({Key? key, this.notification}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends BaseState<GalleryScreen, GalleryBloc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('Notification: ${widget.notification}'),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('send data to edit profile'),
              onPressed: () {
                context.read<ProfileSharedBloc>().setData(100);
                AutoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
