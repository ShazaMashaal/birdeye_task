import 'package:birdeye_task/views/albumDetails/view.dart';
import 'package:birdeye_task/widgets/custom_container.dart';
import 'package:birdeye_task/widgets/custom_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumsView extends StatefulWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  State<AlbumsView> createState() => _AlbumsViewState();
}

class _AlbumsViewState extends State<AlbumsView> {
  final List albums = [];
  Future<void> getAlbums() async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/albums/');
      final data = response.data;

      albums.addAll(data);

      print(data);
    } catch (e) {
      print(e);
    }
    super.initState();
  }

  @override
  initState() {
    getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      itemCount: albums.length,
      title: "Albums",
      itemBuilder: (context, index) => InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  AlbumDetailsView(id:albums[index]['id']))),
        child: CustomContainer(
          child: Row(
            children: [
              Expanded(child: Text(albums[index]["title"])),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
