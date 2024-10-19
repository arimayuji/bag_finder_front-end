import 'package:bag_finder_frontend/app/presentation/home/widget/appbar/home_app_bar_widget.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/stores/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var provider = Modular.get<UserProvider>();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: HomeAppBarWidget(userName: provider.user!.fullName,),
        ),
        const Padding(
          padding: EdgeInsets.only(
            right: AppDimensions.paddingMedium,
            left: AppDimensions.paddingMedium,
            bottom: AppDimensions.paddingMedium,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ],
    );
  }
}
