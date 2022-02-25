import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/modules/auth/pages/signup/signup_controller.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/components/appbar_widget.dart';
import 'package:ifchat/app/shared/components/icon_button_widget.dart';
import 'package:ifchat/app/shared/models/picked_image_model.dart';
import 'package:ifchat/app/shared/utils/utils.dart';
import 'package:image_crop/image_crop.dart';

class RegisterPhotosPage extends StatefulWidget {
  const RegisterPhotosPage({Key? key}) : super(key: key);

  @override
  _RegisterPhotosPageState createState() => _RegisterPhotosPageState();
}

class _RegisterPhotosPageState extends State<RegisterPhotosPage> {
  final controller = Modular.get<SignupController>();

  void _pickImage() async {
    final file = await Utils.pickImageFromGallery();
    if (file != null) {
      final croppedFile = await Modular.to.push<File>(
        MaterialPageRoute(builder: (_) => _CropImagePage(imageFile: file.data)),
      );
      controller.addImage(PickedImageModel(
        data: croppedFile!,
        name: file.name,
      ));
    }
  }

  void _registerUser() async {
    final response = await controller.registerUser();
    if (response != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(response)));
      await controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          'Cadastrar',
          style: TextStyle(
            color: AppColors.ifWhite,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, contraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: contraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Adicione de uma à três fotos',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Observer(builder: (_) {
                        return Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.center,
                          children: controller.photos
                              .map((file) => _buildImageItem(
                                    file,
                                    controller.removeImage,
                                  ))
                              .toList(),
                        );
                      }),
                    ),
                    Observer(builder: (_) {
                      return controller.isLoading
                          ? const LinearProgressIndicator()
                          : const SizedBox(height: 2);
                    }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Observer(builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'add-image',
              backgroundColor: AppColors.ifMaterialGreenColor,
              onPressed: controller.canAddAnotherImage ? _pickImage : null,
              child: const Icon(
                Icons.add,
                color: AppColors.ifWhite,
              ),
            ),
            const SizedBox(height: 10.0),
            FloatingActionButton.extended(
              heroTag: 'finish',
              backgroundColor: AppColors.ifMaterialGreenColor,
              disabledElevation: 0.0,
              onPressed: controller.done ? _registerUser : null,
              label: const Text(
                'Finalizar',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.ifWhite,
                ),
              ),
              icon: const Icon(
                Icons.done,
                color: AppColors.ifWhite,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildImageItem(
      PickedImageModel image, ValueChanged<PickedImageModel> delete) {
    return Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: AppColors.ifRed,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: AspectRatio(
                  aspectRatio: 3.0 / 4.0,
                  child: Image.file(
                    image.data,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => delete(image),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: AppColors.ifWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CropImagePage extends StatefulWidget {
  const _CropImagePage({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  final File imageFile;

  @override
  State<_CropImagePage> createState() => _CropImagePageState();
}

class _CropImagePageState extends State<_CropImagePage> {
  final _cropKey = GlobalKey<CropState>();
  bool _isCropping = false;

  void _cropImage() async {
    setState(() {
      _isCropping = true;
    });

    final crop = _cropKey.currentState!;
    final area = crop.area;

    final croppedImageFile = await ImageCrop.cropImage(
      file: widget.imageFile,
      area: area!,
    );

    Modular.to.pop<File>(croppedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Crop(
                  key: _cropKey,
                  image: FileImage(widget.imageFile),
                  aspectRatio: 3.0 / 4.0,
                ),
              ),
              LinearProgressIndicator(value: _isCropping ? null : 1.0),
              Container(
                color: AppColors.ifWhite,
                padding: const EdgeInsets.all(16.0),
                child: IconButtonWidget(
                  onPressed: _cropImage,
                  icon: Icons.crop,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
