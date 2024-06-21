import "dart:math";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:image_gallery_saver/image_gallery_saver.dart";
import "package:wallpaper_app/data.dart";

void main() {
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  void downloadImage(String url) async {
    final ByteData bytes = await rootBundle.load(url);
    final Uint8List list = bytes.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Wallpaper App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: min(data1.length, data2.length),
            itemBuilder: ((BuildContext context, int index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          data1[index],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          data2[index],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => downloadImage(data1[index]),
                          child: const Text("Download Image")),
                      ElevatedButton(
                          onPressed: () => downloadImage(data2[index]),
                          child: const Text("Download Image")),
                    ],
                  ),
                ],
              );
            })),
      ),
    );
  }
}
