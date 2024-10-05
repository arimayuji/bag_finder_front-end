import 'package:bag_finder_frontend/app/presentation/landing/widget/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider<SerialPortProvider>.value(
        //   value: Modular.get<SerialPortProvider>(),
        // )
      ],
      child: const Scaffold(
        body: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: RouterOutlet(),
        ),
        extendBody: true,
        bottomNavigationBar: BottomNavigationWidget(),
      ),
    );
  }
}
