import "dart:typed_data";
import 'package:image_gallery_saver/image_gallery_saver.dart';
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:wallpaper_app/data.dart";

void main() {
  runApp(const WallpaperApp());
}

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    void downloadImage(String url) async {
      final ByteData bytes = await rootBundle.load(url);
      final Uint8List list = bytes.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(list);
    }

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
          itemCount: data1.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            data1[index],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => downloadImage(data1[index]),
                            child: const Text("Download Image")),
                      ],
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            data2[index],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () => downloadImage(data2[index]),
                            child: const Text("Download Image")),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
