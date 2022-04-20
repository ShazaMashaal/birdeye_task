import 'package:birdeye_task/views/albumDetails/view.dart';
import 'package:birdeye_task/views/albums/cubit.dart';
import 'package:birdeye_task/views/albums/states.dart';
import 'package:birdeye_task/widgets/custom_container.dart';
import 'package:birdeye_task/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumsCubit()..getAlbums(context),
      child: CustomScaffold(
        title: "Albums",
        child:
            BlocBuilder<AlbumsCubit, AlbumsStates>(builder: (context, state) {
          final cubit = AlbumsCubit.of(context);
          return state is AlbumsLoading?const Center(child: CircularProgressIndicator()): ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AlbumDetailsView(id: cubit.albums[index]['id']))),
              child: CustomContainer(
                child: Row(
                  children: [
                    Expanded(child: Text(cubit.albums[index]["title"])),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: 12,
            ),
            itemCount: cubit.albums.length,
          );
        }),
      ),
    );
  }
}
