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
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final SignInController filterController = Modular.get<SignInController>();
  final UserProvider provider = Modular.get<UserProvider>();

  bool isLoginButtonEnabled() {
    return filterController.email != null &&
        filterController.password != null &&
        filterController.email!.isNotEmpty &&
        filterController.password!.isNotEmpty;
  }

  Future<Map<String, dynamic>> login(BuildContext context) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': filterController.email,
        'password': filterController.password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return {
        'userId': data['userId'],
        'userName': data['userName'],
      };
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário ou senha inválidos.')),
      );
      return {'userId': -1, 'userName': null};
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer login.')),
      );
      return {'userId': -1, 'userName': null};
    }
  }

  Future<void> fetchBags(int userId) async {
    final response = await http.get(
      Uri.parse('http://localhost:5000/bags?userId=$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Nenhuma mala encontrada.')),
        );
        return;
      }
      print(data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao buscar malas.')),
      );
    }
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
          const SizedBox(height: AppDimensions.verticalSpaceMedium),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LoginTextField(
                onChanged: (value) {
                  filterController.setEmail(value);
                  setState(() {});
                },
                prefixIcon: AppIconsSecondaryGrey.emailIcon,
                hint: AppLocalizations.of(context)!.emailPlaceholder,
                isPassword: false,
                fieldType: 'email',
                isRequired: true,
              ),
              const SizedBox(height: AppDimensions.verticalSpaceLarge),
              LoginTextField(
                onChanged: (value) {
                  filterController.setPassword(value);
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
              onPressed: isLoginButtonEnabled()
                  ? () async {
                      if (filterController.areFieldsValid()) {
                        Map<String, dynamic> loginResponse = await login(context);
                        int userId = loginResponse['userId'];
                        String? userName = loginResponse['userName'];

                        if (userId != -1) {
                          provider.user = UserEntity(
                            id: userId.toString(),
                            email: filterController.email!,
                            password: filterController.password!,
                            name: userName ?? '',
                            phone: '',
                            photoUrl: null,
                            isAdmin: false,
                          );

                          Modular.to.navigate('/user/home');
                        }
                      }
                    }
                  : null,
              child: Text(
                AppLocalizations.of(context)!.loginPageButtonLogin,
                style: AppTextStyles.button,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  ),
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
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
