import 'package:flutter/widgets.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
    this.fit,
  }) : super();

  final String url;
  final double? width;
  final double? height;
  final ImageErrorWidgetBuilder? errorBuilder;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      errorBuilder: errorBuilder,
      fit: fit,
    );
  }
}
