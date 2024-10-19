import 'package:bag_finder_frontend/app/presentation/user/controller/sign_in_controller.dart';
import 'package:bag_finder_frontend/app/presentation/user/widgets/login_text_field.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_text_styles.dart';
import 'package:bag_finder_frontend/app/stores/user_provider.dart';
import 'package:bag_finder_frontend/domain/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController signInController = Modular.get<SignInController>();
  UserProvider provider = Modular.get<UserProvider>();

  bool isLoginButtonEnabled() {
    if (signInController.email == null || signInController.password == null) {
      return false;
    }

    return signInController.email!.isNotEmpty &&
        signInController.password!.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: Image.asset(
              'images/luggage-two-persons.png',
              filterQuality: FilterQuality.high,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.loginPageTitle,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(
            height: AppDimensions.verticalSpaceMedium,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginTextField(
                onChanged: (String value) {
                  signInController.setEmail(value);
                  setState(() {});
                },
                prefixIcon: AppIconsSecondaryGrey.emailIcon,
                hint: AppLocalizations.of(context)!.emailPlaceholder,
                isPassword: false,
                fieldType: 'email',
                isRequired: true,
              ),
              const SizedBox(
                height: AppDimensions.verticalSpaceLarge,
              ),
              LoginTextField(
                onChanged: (String value) {
                  signInController.setPassword(value);
                  setState(() {});
                },
                prefixIcon: AppIconsSecondaryGrey.passwordIcon,
                hint: AppLocalizations.of(context)!.passwordPlaceholder,
                isPassword: true,
                fieldType: 'password',
                isRequired: true,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: signInController.rememberMe,
                    onChanged: (value) {
                      setState(() {
                        signInController.setRememberMe(value);
                      });
                    },
                  ),
                  Text(
                    AppLocalizations.of(context)!.loginPageRememberMe,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.secondaryGrey,
                        ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Modular.to.navigate('/login/find-your-account');
                },
                child: Text(
                  AppLocalizations.of(context)!.loginPageForgotPassword,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary,
                        decorationThickness: 2,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoginButtonEnabled()
                  ? () async {
                      if (signInController.areFieldsValid()) {
                        UserEntity? user = await provider.loginUser(
                          email: signInController.email!,
                          password: signInController.password!,
                        );

                        user != null ? Modular.to.navigate('/user/home') : null;
                      }
                    }
                  : null,
              child: Text(
                AppLocalizations.of(context)!.loginPageButtonLogin,
                style: AppTextStyles.button,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.loginPageDoesntHaveAccount,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.secondaryGrey,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Modular.to.navigate('/login/sign-up');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.signUpPageButtonSignUp,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                          ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.loginPageTitle3,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: AppColors.secondaryGrey,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Modular.to.navigate('/login/contact-us');
                    },
                    child: Text(
                      AppLocalizations.of(context)!.loginPageContactSupport,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.primary,
                            decorationThickness: 2,
                          ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
