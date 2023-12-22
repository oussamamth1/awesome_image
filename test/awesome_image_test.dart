import 'package:flutter_test/flutter_test.dart';

import 'package:awesome_image/awesome_image.dart';


void main() {
  test('get image URL', () {
    final awesomeImage = AwesomeImage('https://example.com/image.jpg');
    expect(awesomeImage.getImageUrl(), 'https://example.com/image.jpg');
  });

  // You can add more tests for other methods or properties of AwesomeImage
}
