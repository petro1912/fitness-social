import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness/constants.dart';
import 'package:flutter/cupertino.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;
  final Widget titleText;
  final Color dotColor;
  final bool bulletBottom;

  ImageSlider({this.images, this.titleText, this.dotColor, this.bulletBottom});
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentImageIndex = 0;
  List images = [];
  Widget titleText;
  Color dotColor;
  bool bulletBottom;

  void initState() {
    super.initState();
    images = widget.images;
    dotColor = widget.dotColor;
    titleText = widget.titleText;
    bulletBottom = widget.bulletBottom;
  }

  List<Widget> _buildImages() {
    return List.generate(
      images.length,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          image: DecorationImage(
            image: getAssetImage(images[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselBullets() {
    var dotColor = widget.dotColor ?? secondaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentImageIndex == index
                ? dotColor
                : dotColor.withOpacity(.5),
          ),
        ),
      ),
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        onPageChanged: (index, reason) {
          setState(() {
            _currentImageIndex = index;
          });
        },
      ),
      items: _buildImages(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImageSlider(),
        Container(
          padding: mainHrPadding,
          margin: EdgeInsets.only(top: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: bulletBottom != null && bulletBottom
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.center,
            children: [
              this.titleText,
              _buildCarouselBullets(),
            ],
          ),
        ),
      ],
    );
  }
}
