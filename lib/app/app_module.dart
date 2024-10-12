import 'package:bag_finder_frontend/app/presentation/home/pages/home_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/controller/landing_page_step_progess.dart';
import 'package:bag_finder_frontend/app/presentation/home/landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/splash_page.dart';
import 'package:bag_finder_frontend/app/presentation/landing/welcome_landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/controller/sign_in_controller.dart';
import 'package:bag_finder_frontend/app/presentation/login/login_landing_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/landing/contact_us_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/landing/find_your_account_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/landing/forgot_password_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/sign_in_page.dart';
import 'package:bag_finder_frontend/app/presentation/login/pages/sign_up_page.dart';
import 'package:bag_finder_frontend/app/shared/helpers/environments/environment_config.dart';
import 'package:bag_finder_frontend/app/stores/user_provider.dart';
import 'package:bag_finder_frontend/domain/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<LandingPageStepProgess>(LandingPageStepProgess.new);
    i.addLazySingleton<UserProvider>(UserProvider.new);
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
      '/user',
      module: HomeModule(),
      transition: TransitionType.leftToRight,
    );

    r.module(
      '/login',
      module: UserModule(),
      transition: TransitionType.leftToRight,
    );
  }
}

class UserModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<SignInController>(SignInController.new);
    i.addSingleton(UserProvider.new);
    i.addSingleton<IUserRepository>(
      () => EnvironmentConfig.getUserRepository(),
      config: BindConfig(),
    );
  }

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
        ),
        ChildRoute(
          '/find-your-account',
          child: (context) => const FindYourAccountPage(),
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
      ],
    );
  }
}
