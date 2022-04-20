import 'package:birdeye_task/views/getPhoto/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class GetPhotoCubit extends Cubit<GetPhotoStates> {
  GetPhotoCubit() : super(GetPhotoInit());

  static GetPhotoCubit of(context) => BlocProvider.of(context);
  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton(
                  child: const Text('Open Camera to Capture a Photo'),
                  onPressed: () => pickPhoto(true),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                TextButton(
                    child: const Text('Open Gallery to Pick a Photo'),
                    onPressed: () => pickPhoto(false)),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> pickPhoto(bool? cameraSource) async {
    await ImagePicker().pickImage(
        source: cameraSource! ? ImageSource.camera : ImageSource.gallery);

    emit(GetPhotoInit());
  }
}
