import 'package:bag_finder_frontend/app/presentation/home/pages/home_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/controller/landing_page_step_progess.dart';
import 'package:bag_finder_frontend/app/presentation/home/landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/splash_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/welcome_landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/login_landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/contact_us_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/forgot_password_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/sign_in_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/sign_up_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LandingPageStepProgess>(LandingPageStepProgess.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage(),
      transition: TransitionType.leftToRight,
    );

    r.child(
      '/welcome',
      child: (context) => const WelcomeLandingPage(),
      transition: TransitionType.leftToRight,
    );

    r.module(
      '/home',
      module: HomeModule(),
      transition: TransitionType.leftToRight,
    );

    r.module(
      '/login',
      module: LoginModule(),
      transition: TransitionType.leftToRight,
    );
  }
}

class LoginModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LoginLandingPage(),
      children: [
        ChildRoute(
          '/sign-in',
          child: (context) => const SignInPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/sign-up',
          child: (context) => const SignUpPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/contact-us',
          child: (context) => const ContactUsPage(),
          transition: TransitionType.rightToLeft,
        ),
        ChildRoute(
          '/fogot-password',
          child: (context) => const ForgotPasswordPage(),
          transition: TransitionType.rightToLeft,
        )
      ],
    );
  }
}

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const LandingPage(),
      children: [
        ChildRoute(
          '/home',
          child: (context) => const HomePage(),
          transition: TransitionType.leftToRight,
        ),
        // ChildRoute(
        //   '/charts',
        //   child: (context) => const ChartsPage(),
        // ),
        // ChildRoute(
        //   '/history',
        //   child: (context) => const HistoryPage(),
        // ),
      ],
    );
  }
}
