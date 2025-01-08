import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:programming_languages_project/Cubits/auth_cubit/auth_cubit.dart';
import 'package:programming_languages_project/core/models/user_model.dart';

import 'custom_button.dart';

class ProfileDrawer extends StatefulWidget {
  const ProfileDrawer({
    super.key,
  });

  @override
  State<ProfileDrawer> createState() => _ProfileDrawerState();
}

class _ProfileDrawerState extends State<ProfileDrawer> {
  UserModel? userModel;

  @override
  void initState() {
    userModel = context.read<AuthCubit>().user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          const Icon(
            Icons.person,
            size: 50,
          ),
          CustomButton(
              primaryColor: Colors.white,
              onPressed: () {
                context.read<AuthCubit>().logOut();
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('تسجيل الخروج'),
                  Gap(10),
                  Icon(Icons.logout),
                ],
              )),
          if (userModel != null)
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                        "${userModel!.data.user.firstName}+ ${userModel!.data.user.lastName}"),
                    leading: const Icon(Icons.person),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
