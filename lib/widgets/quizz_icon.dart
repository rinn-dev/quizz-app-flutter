import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizz_app/constants/colors.dart';

class QuizzIcon extends StatelessWidget {
  final String iconUrl;
  const QuizzIcon({super.key, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: ColoredBox(
          color: const Color(softBackground),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: Get.width * 0.15,
              height: Get.width * 0.15,
              child: CachedNetworkImage(
                imageUrl: iconUrl,
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(
                    color: Color(highlightColor),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/physics.png"),
              ),
            ),
          ),
        ));
  }
}
