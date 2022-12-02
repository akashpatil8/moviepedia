import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loadLogin() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed('/login');
    });
  }

  @override
  void initState() {
    super.initState();
    loadLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              radius: 45.0,
              child: ImageIcon(
                const AssetImage(MyIcons.mLogo),
                size: 60,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'MoviePedia',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
