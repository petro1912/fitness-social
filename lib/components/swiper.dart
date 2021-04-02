import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperSlider extends StatefulWidget {
  final IndexedWidgetBuilder itemBuilder;
  final double itemWidth, itemHeight;
  final int index, itemCount;
  final Function onIndexChanged;
  SwiperSlider({
    this.index,
    this.itemBuilder,
    this.itemCount,
    this.onIndexChanged,
    this.itemWidth,
    this.itemHeight,
  });
  _StateSwiper createState() => _StateSwiper();
}

class _StateSwiper extends State<SwiperSlider> {
  int _itemCount, _index;

  bool _loop;

  bool _autoplay;

  int _autoplayDely;

  bool _outer;

  double _viewportFraction;

  SwiperLayout _layout;

  double _scale;

  Axis _scrollDirection;

  Curve _curve;

  double _fade;

  bool _autoplayDisableOnInteraction;

  CustomLayoutOption customLayoutOption;
  SwiperController _controller;

  @override
  void initState() {
    // customLayoutOption = new CustomLayoutOption(startIndex: -1, stateCount: 3)
    //     .addRotate([-25.0 / 180, 0.0, 25.0 / 180]).addTranslate([
    //   new Offset(-350.0, 0.0),
    //   new Offset(0.0, 0.0),
    //   new Offset(350.0, 0.0)
    // ]);

    super.initState();
    setState(() {
      _fade = 1.0;
      _curve = Curves.ease;
      _scale = 0.8;
      _controller = new SwiperController();
      _layout = SwiperLayout.STACK;
      _loop = false;
      _itemCount = widget.itemCount;
      _autoplay = false;
      _autoplayDely = 3000;
      _viewportFraction = 0.8;
      _outer = false;
      _scrollDirection = Axis.horizontal;
      _autoplayDisableOnInteraction = false;
      _index = widget.index;
    });
  }

  void onIndexChanged(int index) {
    widget.onIndexChanged(index);
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      customLayoutOption: customLayoutOption,
      fade: _fade,
      index: _index,
      onIndexChanged: onIndexChanged,
      curve: _curve,
      scale: _scale,
      itemWidth: widget.itemWidth,
      controller: _controller,
      layout: _layout,
      outer: _outer,
      itemHeight: widget.itemHeight,
      viewportFraction: _viewportFraction,
      autoplayDelay: _autoplayDely,
      loop: _loop,
      autoplay: _autoplay,
      itemBuilder: widget.itemBuilder,
      itemCount: _itemCount,
      scrollDirection: _scrollDirection,
      autoplayDisableOnInteraction: _autoplayDisableOnInteraction,
    );
  }
}
