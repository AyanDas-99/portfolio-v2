import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  const NetworkImageView({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Center(
                child: FadeInImage(
                  placeholder: const AssetImage(
                      "assets/images/personal_brand_white.png"),
                  image: NetworkImage(url),
                  fit: BoxFit.fitWidth,
                  height: 500,
                ),
              ),
            );
          },
          child: FadeInImage(
            placeholder:
                const AssetImage("assets/images/personal_brand_white.png"),
            image: NetworkImage(url),
            fit: BoxFit.fitWidth,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/personal_brand_white.png");
            },
          ),
        ),
      ),
    );
  }
}
