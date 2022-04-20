import 'package:birdeye_task/dio_helper.dart';
import 'package:birdeye_task/views/albumDetails/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumDetailsCubit extends Cubit<AlbumDetailsStates> {
  AlbumDetailsCubit() : super(AlbumDetailsInit());
  static AlbumDetailsCubit of(context) => BlocProvider.of(context);

  List details = [];

  Future<void> getAlbumDetails(int id, context) async {
    emit(AlbumDetailsLoading());

    try {
      final response = await DioHelper.get('albums/$id/photos');
      details.clear();
      details.addAll(response!.data);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    emit(AlbumDetailsInit());
  }
}
