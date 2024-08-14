import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
  });

  final String url;
  final double? width;
  final double? height;
  final ImageErrorWidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView.fromTagName(
        tagName: 'img',
        onElementCreated: (Object element) {
          try {
            final img = element as HTMLImageElement;
            img.src = url;
            img.style.width = '${width ?? 'auto'}';
            img.style.height = '${height ?? 'auto'}';
            img.style.marginLeft = 'auto';
            img.style.marginRight = 'auto';
            img.style.display = 'block';
            img.onerror = (event) {
              debugPrint('NetworkImagePlus: onError event - $event');
              errorBuilder?.call(context, element, null);
            } as OnErrorEventHandler;
          } catch (e) {
            debugPrint('NetworkImagePlus: $e');
          }
        },
      ),
    );
  }
}
