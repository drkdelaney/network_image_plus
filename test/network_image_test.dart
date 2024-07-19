import 'package:flutter_test/flutter_test.dart';
import 'package:network_image/network_image.dart';

void main() {
  test('Displays a NetworkImage', () {
    const image = NetworkImage(
      url: 'https://example.com/image.png',
      width: 100,
      height: 100,
    );

    expect(image.url, 'https://example.com/image.png');
    expect(image.width, 100);
    expect(image.height, 100);
    expect(image, isA<NetworkImage>());
  });
}
