import 'package:apps_factory/app/data/albums/cache/hive_album_model.dart';
import 'package:apps_factory/app/data/albums/mappers/album_mapper.dart';
import 'package:apps_factory/app/view/album_screen/album_screen.dart';
import 'package:apps_factory/app/view/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _inputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums Lib'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      style: const TextStyle(fontSize: 15, color: Colors.black54),
                      controller: _inputController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SearchScreen(request: _inputController.text)),
                          );
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffixIcon: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SearchScreen(request: _inputController.text)),
                            );
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        hintText: 'Find artist',
                        hintStyle: const TextStyle(fontSize: 15.0, color: Colors.grey),
                        contentPadding: const EdgeInsets.all(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text('Your library', style: Theme.of(context).textTheme.headline4),
          ),
          ValueListenableBuilder(
            valueListenable: Hive.box<HiveAlbumModel>('HiveAlbumModel').listenable(),
            builder: (context, Box<HiveAlbumModel> box, _) {
              if (box.values.isEmpty) {
                return const Center(
                  child: Text('Empty'),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    final HiveAlbumModel? res = box.getAt(index);
                    if (res != null) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AlbumScreen(album: res.toModel())),
                          );
                        },
                        child: ListTile(
                          title: Text(res.name),
                          subtitle: Text(res.url),
                        ),
                      );
                    } else {
                      return const Text('Emptiness here');
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
