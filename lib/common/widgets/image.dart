import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new/common/utils/screen.dart';
import 'package:flutter_new/common/values/radii.dart';

Widget imageCached(
  String url, {
  double width = 48,
  double height = 48,
  EdgeInsetsGeometry margin,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) {
      return Container(
        height: duSetHeight(height),
        width: duSetWidth(width),
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: Radii.k6pxRadius,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
    placeholder: (context, url) {
      return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
    },
    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
