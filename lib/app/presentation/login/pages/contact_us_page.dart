import 'package:bag_finder_frontend/app/presentation/login/widgets/login_text_field.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_icons.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primary,
            size: AppDimensions.iconLarge,
          ),
          onPressed: () {
            Modular.to.navigate('/login/sign-in');
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Image.asset(
                'images/group-interrogation.png',
                filterQuality: FilterQuality.high,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.loginPageTitle3,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                LoginTextField(
                  prefixIcon: AppIcons.emailIcon,
                  hint:
                      AppLocalizations.of(context)!.emailForContactPlaceholder,
                ),
                const SizedBox(
                  height: AppDimensions.verticalSpaceLarge,
                ),
                LoginTextField(
                  prefixIcon: AppIcons.messageIcon,
                  hint: AppLocalizations.of(context)!
                      .contactUsYourProblemPlaceholder,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.needHelpPageSend,
                  style: AppTextStyles.button,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
