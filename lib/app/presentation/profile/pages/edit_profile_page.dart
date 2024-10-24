import 'package:bag_finder_frontend/app/presentation/profile/widgets/custom_text_form_field_widget.dart';
import 'package:bag_finder_frontend/app/presentation/profile/widgets/profile_banner_widget.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/stores/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserProvider provider = Modular.get<UserProvider>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.navigate(
                  '/user/home',
                );
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Editar Perfil',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryBlack,
                      ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingMedium,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: UserAvatarWidget(
                      name: provider.user!.fullName,
                    ),
                  ),
                ),
                const Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(hintText: 'Fulano'),
                      CustomTextFormField(hintText: 'fulano@gmail.com'),
                      CustomTextFormField(hintText: '+55 (11) 90123-4567'),
                      CustomTextFormField(hintText: 'Masculino'),
                      CustomTextFormField(hintText: '21/07/2004'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Editar Perfil',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: AppColors.secondary,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
