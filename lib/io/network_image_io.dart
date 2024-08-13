import 'package:flutter/widgets.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  }) : super();

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.network(url, width: width, height: height);
  }
}
