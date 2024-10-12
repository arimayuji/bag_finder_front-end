import 'package:bag_finder_frontend/app/presentation/login/controller/sign_in_controller.dart';
import 'package:bag_finder_frontend/app/presentation/login/widgets/login_text_field.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SignInController filterController = Modular.get<SignInController>();

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
                  filterController.setEmail(value);
                },
                prefixIcon: AppIconsSecondaryGrey.emailIcon,
                hint: AppLocalizations.of(context)!.emailPlaceholder,
              ),
              const SizedBox(
                height: AppDimensions.verticalSpaceLarge,
              ),
              LoginTextField(
                onChanged: (String value) {
                  filterController.setPassword(value);
                },
                prefixIcon: AppIconsSecondaryGrey.passwordIcon,
                hint: AppLocalizations.of(context)!.passwordPlaceholder,
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
                    value: filterController.rememberMe,
                    onChanged: (value) {
                      setState(() {
                        filterController.setRememberMe(value);
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
              onPressed: () {
                Modular.to.navigate('/user/home');
              },
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
