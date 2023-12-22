import 'package:awesome_image/imageWidget.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ImageWithDynamicBackgroundColorusersList extends StatefulWidget {
  final String imageUrl;
  final bool isCirculair;
  final bool color;
 final double? width;
final  double? height;
  ImageWithDynamicBackgroundColorusersList({
    required this.color,
    required this.imageUrl,
    required this.isCirculair,
    required this.width,
    required this.height,
  });

  @override
  _ImageWithDynamicBackgroundColorusersListState createState() =>
      _ImageWithDynamicBackgroundColorusersListState();
}

class _ImageWithDynamicBackgroundColorusersListState
    extends State<ImageWithDynamicBackgroundColorusersList> {
  Color? backgroundColor;

  @override
  void initState() {
    super.initState();
    loadImagePalette();
  }

  Future<void> loadImagePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(NetworkImage(widget.imageUrl));

    if (mounted) {
      setState(() {
        backgroundColor = paletteGenerator.dominantColor?.color ??
            Color.fromARGB(1, 228, 3, 3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isCirculair
        ? Container(
            width: widget.width ?? 50,
            height: widget.height ??50,
            padding: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color ? backgroundColor : Colors.black,
            ),
            child: ImageWidget(
              imagePath: widget.imageUrl,
              onClicked: () {},
            ),
          )
        : Image.network(widget.imageUrl);
  }
}
