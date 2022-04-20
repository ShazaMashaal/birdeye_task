import 'package:birdeye_task/dio_helper.dart';
import 'package:birdeye_task/views/albums/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsCubit extends Cubit<AlbumsStates> {
  AlbumsCubit() : super(AlbumsInit());
  static AlbumsCubit of(context)=>BlocProvider.of(context);

  List albums = [];

  Future<void> getAlbums(context) async {
    emit(AlbumsLoading());
    try {
      final response = await DioHelper.get('albums');
      albums.clear();
      albums.addAll(response!.data);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));    }
    emit(AlbumsInit());
  }
}
