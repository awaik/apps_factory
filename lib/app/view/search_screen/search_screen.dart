import 'package:apps_factory/app/domain/artist/artist_model.dart';
import 'package:apps_factory/app/domain/errors/api_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  final String request;

  const SearchScreen({this.request = ''});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _inputController = TextEditingController();

  @override
  void initState() {
    // if (widget.request.length > 0) {
    //   Provider.of<SearchViewModel>(context, listen: false).getArtists(widget.request);
    // }
    super.initState();
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ApiResponse apiResponse = Provider.of<SearchViewModel>(context).response;

    Widget getArtistWidget(BuildContext context, ApiResponse apiResponse) {
      final List<ArtistModel>? artistList = apiResponse.data as List<ArtistModel>?;
      switch (apiResponse.status) {
        case Status.loading:
          return const Center(child: CircularProgressIndicator());
        case Status.completed:
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Expanded(
                flex: 8,
                child: Text('not implemented'),
              ),
            ],
          );
        case Status.error:
          return Center(
            child: Text(apiResponse.data),
          );
        case Status.initial:
        default:
          return const Center(
            child: Text('Type something in the search bar and find artist.'),
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find artist'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withAlpha(50),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextField(
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey,
                        ),
                        controller: _inputController,
                        onSubmitted: (value) {
                          Provider.of<SearchViewModel>(context, listen: false).getArtists(_inputController.text);
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: 'Find artist',
                        )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: getArtistWidget(context, apiResponse)),
        ],
      ),
    );
  }
}
