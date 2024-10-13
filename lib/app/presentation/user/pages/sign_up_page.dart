import 'package:bag_finder_frontend/app/presentation/user/widgets/login_text_field.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              width: 300,
              height: 200,
            ),
            Text(
              AppLocalizations.of(context)!.loginPageTitle2,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              AppLocalizations.of(context)!.loginPageTitle2SecondLine,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoginTextField(
                  prefixIcon: AppIconsSecondaryGrey.personIcon,
                  hint: AppLocalizations.of(context)!.fullNamePlaceholder,
                  isPassword: false,
                  fieldType: 'name',
                  isRequired: true,
                ),
                const SizedBox(
                  height: AppDimensions.verticalSpaceLarge,
                ),
                LoginTextField(
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
                  prefixIcon: AppIconsSecondaryGrey.passwordIcon,
                  hint: AppLocalizations.of(context)!.passwordPlaceholder,
                  isPassword: true,
                  fieldType: 'name',
                  isRequired: true,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.signUpPageButtonSignUp,
                  style: AppTextStyles.button,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.loginPageAlreadyHaveAccount,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.secondaryGrey,
                      ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.to.navigate('/login/sign-in');
                  },
                  child: Text(
                    AppLocalizations.of(context)!.loginPageClickHere,
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
        ),
      ),
    );
  }
}
