import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

class NetworkImage extends StatelessWidget {
  const NetworkImage({
    super.key,
    required this.url,
    required this.width,
    required this.height,
  });

  final String url;
  final int width;
  final int height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.toDouble(),
      height: height.toDouble(),
      child: HtmlElementView.fromTagName(
        tagName: 'img',
        onElementCreated: (Object element) {
          final img = element as HTMLImageElement;
          img.src = url;
          img.width = width;
          img.height = height;
        },
      ),
    );
  }
}
