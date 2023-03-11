import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemData extends StatelessWidget {
  final String avatar;
  final String name;
  final String email;
  const ItemData(
      {super.key,
      required this.avatar,
      required this.email,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _leadingAvatar(avatar),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(email), Text(name)],
        ),
      ),
    );
  }

  Widget _leadingAvatar(String avatar) {
    return CachedNetworkImage(
      width: 50,
      height: 50,
      imageUrl: avatar,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.red,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
