import 'package:bag_finder_frontend/app/presentation/profile/widgets/profile_banner_widget.dart';
import 'package:bag_finder_frontend/app/presentation/profile/widgets/profile_info_field_widget.dart';
import 'package:bag_finder_frontend/app/shared/screen_helper.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_colors.dart';
import 'package:bag_finder_frontend/app/shared/themes/app_dimensions.dart';
import 'package:bag_finder_frontend/app/stores/user_provider.dart';
import 'package:bag_finder_frontend/domain/enums/user_gender_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  'Meu Perfil',
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
                  child: ProfileBannerWidget(
                    user: provider.user!,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InfoField(
                        title: 'E-mail',
                        content: provider.user!.email,
                      ),
                      InfoField(
                        title: 'Número de celular',
                        content: provider.user!.phone.isEmpty
                            ? 'Não informado'
                            : provider.user!.phone,
                      ),
                      InfoField(
                        title: 'Gênero',
                        content: provider.user!.gender.toLiteral(),
                      ),
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
                              onPressed: () {
                                Modular.to.navigate(
                                  '/user/profile/edit',
                                );
                              },
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
