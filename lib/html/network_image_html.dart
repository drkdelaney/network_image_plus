import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
  });

  final String url;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView.fromTagName(
        tagName: 'img',
        onElementCreated: (Object element) {
          final img = element as HTMLImageElement;
          img.src = url;
          if (width != null) img.width = width!.toInt();
          if (height != null) img.height = height!.toInt();
        },
      ),
    );
  }
}
