import 'package:flutter/material.dart';
import 'package:reqres/product/_product_exports.dart';

class CustomAppBar extends PreferredSize {
  CustomAppBar({
    super.key,
    Size? size,
    required Routes route,
  }) : super(
          preferredSize: size ?? const Size.fromHeight(kToolbarHeight),
          child: AppBar(
            centerTitle: true,
            title: Center(
              child: Text(route.name),
            ),
          ),
        );
}
