import 'package:birdeye_task/views/albumDetails/cubit.dart';
import 'package:birdeye_task/views/albumDetails/states.dart';
import 'package:birdeye_task/views/albumDetails/widgets/item_card.dart';
import 'package:birdeye_task/widgets/custom_container.dart';
import 'package:birdeye_task/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumDetailsView extends StatelessWidget {
  final int? id;
  const AlbumDetailsView({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumDetailsCubit()..getAlbumDetails(id!,context),
      child: CustomScaffold(
        title: "Album details",
        child: BlocBuilder<AlbumDetailsCubit, AlbumDetailsStates>(
            builder: (context, state) {
          final cubit = AlbumDetailsCubit.of(context);
          return state is AlbumDetailsLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) => CustomContainer(
                      padding: 0,
                      child: ItemCard(
                          title: cubit.details[index]["title"],
                          thumbnailUrl: cubit.details[index]["thumbnailUrl"],
                          url: cubit.details[index]["url"])),
                  itemCount: cubit.details.length,
                );
        }),
      ),
    );
  }
}
