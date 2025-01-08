import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context,
                'signup',
                (route) => false,
              ),
              title: Text('تسجيل الخروج'),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
