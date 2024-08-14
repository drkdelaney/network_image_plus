import 'dart:js' show allowInterop;

import 'package:flutter/widgets.dart';
import 'package:web/web.dart';

class NetworkImagePlus extends StatelessWidget {
  const NetworkImagePlus({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.errorBuilder,
    this.fit,
  });

  final String url;
  final double? width;
  final double? height;
  final ImageErrorWidgetBuilder? errorBuilder;
  final BoxFit? fit;

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
            img.style.width = width != null ? '${width}px' : 'auto';
            img.style.height = height != null ? '${height}px' : 'auto';
            img.style.marginLeft = 'auto';
            img.style.marginRight = 'auto';
            img.style.display = 'block';
            img.style.objectFit = fit?.toCssName ?? 'fill';
            img.onerror = allowInterop((Event event) {
              debugPrint('NetworkImagePlus: onError event - $event');
              errorBuilder?.call(context, event, null);
            }) as OnErrorEventHandler;
          } catch (e) {
            debugPrint('NetworkImagePlus: $e');
          }
        },
      ),
    );
  }
}

extension _FitType on BoxFit {
  String get toCssName {
    switch (this) {
      case BoxFit.fill:
        return 'fill';
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fitWidth:
        return 'fit-width';
      case BoxFit.fitHeight:
        return 'fit-height';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'scale-down';
    }
  }
}
