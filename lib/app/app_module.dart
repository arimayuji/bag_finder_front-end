import 'package:bag_finder_frontend/app/presentation/home/pages/home_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/pages/track_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/pages/safely_remove_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/pages/track_your_bag_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LandingPage(),
      children: [
        ChildRoute(
          '/safely-remove',
          child: (context) => const SafelyRemovePage(),
        ),
        ChildRoute(
          '/track-page',
          child: (context) => const TrackPage()
        ),
        ChildRoute(
          '/track-your-bag',
          child: (context) => const TrackYourBagPage(),
        )
      ],
    );
    r.module('/home', module: HomeModule());
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {
   
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute,
        child: (context) => const LandingPage(),
        children: [
          ChildRoute(
            '/home',
            child: (context) => const HomePage(),
          ),
          // ChildRoute(
          //   '/charts',
          //   child: (context) => const ChartsPage(),
          // ),
          // ChildRoute(
          //   '/history',
          //   child: (context) => const HistoryPage(),
          // ),
        ]);
  }
}
