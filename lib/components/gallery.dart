import 'dart:io';
import 'dart:typed_data';

import 'package:fitness/constants.dart';
import 'package:fitness/screens/sidebar/diary.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryPage extends StatefulWidget {
  GalleryPage({Key key}) : super(key: key);

  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<GalleryPage> {
  List<AssetEntity> assets = [];

  void _fetchAssets() async {
    final albums = await PhotoManager.getAssetPathList(onlyAll: true);
    if (albums.isEmpty) return;
    final recentAlbum = albums.first;

    final recentAssets =
        await recentAlbum.getAssetListRange(start: 0, end: 1000000);
    setState(() => assets = recentAssets);
  }

  Future<void> selectPhoto(AssetEntity entity) async {
    File assetFile = await entity.file;
    Widget routeWidget;

    routeWidget = DiaryScreen(editMode: true, dailyImg: assetFile.path);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => routeWidget,
      ),
    );
  }

  @override
  void initState() {
    _fetchAssets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
        backgroundColor: primaryColor,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: assets.length,
        itemBuilder: (_, index) {
          return AssetThumbnail(
            asset: assets[index],
            selectPhoto: selectPhoto,
          );
        },
      ),
    );
  }
}

class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({
    Key key,
    @required this.asset,
    @required this.selectPhoto,
  }) : super(key: key);

  final AssetEntity asset;
  final void Function(AssetEntity) selectPhoto;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: asset.thumbData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null)
          return Container(
              alignment: Alignment.center,
              width: 40,
              height: 40,
              child: CircularProgressIndicator());
        return GestureDetector(
          onTap: () => selectPhoto(asset),
          child: Image.memory(bytes, fit: BoxFit.cover),
        );
      },
    );
  }
}
