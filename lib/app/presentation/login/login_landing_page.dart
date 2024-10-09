import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginLandingPage extends StatefulWidget {
  const LoginLandingPage({
    super.key,
  });

  @override
  State<LoginLandingPage> createState() => _LoginLandingPageState();
}

class _LoginLandingPageState extends State<LoginLandingPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(
          right: AppDimensions.paddingMedium,
          left:  AppDimensions.paddingMedium,
          bottom: AppDimensions.paddingMedium,
        ),
        child: RouterOutlet(),
      ),
    );
  }
}
