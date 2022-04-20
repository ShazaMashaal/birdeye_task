import 'package:birdeye_task/views/getPhoto/view.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String? title, url, thumbnailUrl;
  const ItemCard({Key? key, this.title, this.url, this.thumbnailUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const GetPhotoView())),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(
                url!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(thumbnailUrl!),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        title!,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
