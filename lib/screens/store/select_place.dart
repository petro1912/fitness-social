import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:fitness/components/main_scaffold.dart';
import 'package:fitness/components/rounded_raised_button.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/screens/store/payment.dart';
import 'package:fitness/utils/navigation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class SelectPlaceScreen extends StatefulWidget {
  SelectPlaceScreen({Key key, this.title}) : super(key: key);
  final String title;

  _SelectPlaceScreenState createState() => _SelectPlaceScreenState();
}

const LatLng _kMapCenter = LatLng(52.4478, -3.5402);

class _SelectPlaceScreenState extends State<SelectPlaceScreen> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _markerIcon;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: _kMapCenter,
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 18);

  void confirmLocation(BuildContext context) {
    navPush(context, PaymentScreen());
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
        icon: _markerIcon,
      );
    } else {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: _kMapCenter,
      );
    }
  }

  void paintTappedImage() async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(
        recorder, Rect.fromPoints(Offset(0.0, 0.0), Offset(660.0, 200.0)));
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(1)
      ..style = PaintingStyle.fill;

    Path pathRRectShadow = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0.0, 660.0, 200.0),
          Radius.circular(24.0),
        ),
      );

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.03)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 14);

    canvas.drawPath(pathRRectShadow, shadowPaint);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(30, 30, 600.0, 140.0), Radius.circular(24.0)),
        paint);
    paintText(canvas);
    paintSubText(canvas);
    var labelIcon = await loadUiImage('assets/icons/marker_send.png');
    var markerImage = await loadUiImage('assets/icons/marker.png');
    paintImage(labelIcon, const Rect.fromLTWH(60, 60, 80.0, 80.0), canvas,
        paint, BoxFit.contain);
    paintImage(markerImage, const Rect.fromLTWH(240.0, 180.0, 120.0, 120.0),
        canvas, paint, BoxFit.contain);
    final Picture picture = recorder.endRecording();
    final img = await picture.toImage(660, 360);
    final pngByteData = await img.toByteData(format: ImageByteFormat.png);
    setState(() {
      _markerIcon =
          BitmapDescriptor.fromBytes(Uint8List.view(pngByteData.buffer));
    });
  }

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }

  void paintText(Canvas canvas) {
    final textStyle = TextStyle(
      color: textColor,
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(
      text: 'Al-Mamlaka Mall',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 440,
    );
    final offset = Offset(170, 60);
    textPainter.paint(canvas, offset);
  }

  void paintSubText(Canvas canvas) {
    final textStyle = TextStyle(
      color: greyTextColor,
      fontSize: 26,
    );
    final textSpan = TextSpan(
      text: 'Tahlia Street, Riyadh, Saudi Arebia',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 400,
    );
    final offset = Offset(170, 110);
    textPainter.paint(canvas, offset);
  }

  void paintImage(
      ui.Image image, Rect outputRect, Canvas canvas, Paint paint, BoxFit fit) {
    final Size imageSize =
        Size(image.width.toDouble(), image.height.toDouble());
    final FittedSizes sizes = applyBoxFit(fit, imageSize, outputRect.size);
    final Rect inputSubrect =
        Alignment.center.inscribe(sizes.source, Offset.zero & imageSize);
    final Rect outputSubrect =
        Alignment.center.inscribe(sizes.destination, outputRect);
    canvas.drawImageRect(image, inputSubrect, outputSubrect, paint);
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      getBytesFromAsset('assets/icons/marker.png', 120).then(_updateBitmap);
    }
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void _updateBitmap(Uint8List bitmap) {
    setState(() {
      _markerIcon = BitmapDescriptor.fromBytes(bitmap);
    });
  }

  Widget build(BuildContext context) {
    paintTappedImage();
    return MainScaffold(
      title: 'checkout',
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _kGooglePlex,
            markers: <Marker>{_createMarker()},
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: PrimaryBlockButton(
              label: 'Confirm Location',
              action: () => confirmLocation(context),
            ),
          )
        ],
      ),
    );
  }
}
