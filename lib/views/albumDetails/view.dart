import 'package:birdeye_task/widgets/custom_container.dart';
import 'package:birdeye_task/widgets/custom_scaffold.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlbumDetailsView extends StatefulWidget {
  final int? id;
  const AlbumDetailsView({Key? key, this.id}) : super(key: key);

  @override
  State<AlbumDetailsView> createState() => _AlbumDetailsViewState();
}
final List albumDetails = [];
Future<void> getAlbumDetails() async {
  try {
    final response =
    await Dio().get('https://jsonplaceholder.typicode.com/albums/1/photos');
    final data = response.data;

    albumDetails.addAll(data);
print(albumDetails);
    print(data);
  } catch (e) {
    print(e);
  }
}

@override
initState() {
  getAlbumDetails();
}
class _AlbumDetailsViewState extends State<AlbumDetailsView> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Album details",
      itemCount: albumDetails.length,
      itemBuilder: (context,index)=>CustomContainer(
         child: Row(
            children: [
              Expanded(child: Text(albumDetails[index]["title"])),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.grey,
              )
            ],
          )
      ),
    );
  }
}
