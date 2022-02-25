import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart' as o;
import 'package:ifchat/app/shared/icons/app_icons.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = UserModel(
    course: 'Computação',
    name: 'Breno',
    photos: ['https://picsum.photos/id/1005/300/400'],
    id: 'fg5g44g65dg4b4',
    birth: DateTime(2000),
    degree: Degree.sup,
    campus: Campus.fortaleza,
    gender: Gender.feminino,
    orientation: o.Orientation.hetero,
  );

  @override
  Widget build(BuildContext context) {
    const optionTextStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.normal,
      color: AppColors.ifGray,
    );

    const headerTextStyle = TextStyle(
      color: AppColors.ifWhite,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(320),
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.ifLinearGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 110,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Profile',
                  style: headerTextStyle,
                ),
              ),
              CircleAvatar(
                radius: 85,
                backgroundImage: NetworkImage(currentUser.photos.first),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  currentUser.name,
                  style: headerTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <ListTile>[
          ListTile(
            title: const Text(
              'Editar Perfil',
              style: optionTextStyle,
            ),
            trailing: const Icon(
              AppIcons.edit,
              color: AppColors.ifGray,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Atualizar Preferências',
              style: optionTextStyle,
            ),
            trailing: const Icon(
              AppIcons.update,
              color: AppColors.ifGray,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Sobre',
              style: optionTextStyle,
            ),
            trailing: const Icon(
              AppIcons.about,
              color: AppColors.ifGray,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Configurações',
              style: optionTextStyle,
            ),
            trailing: const Icon(
              AppIcons.settings,
              color: AppColors.ifGray,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
              'Sair',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: AppColors.ifRed,
              ),
            ),
            trailing: const Icon(
              AppIcons.logout,
              color: AppColors.ifRed,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
