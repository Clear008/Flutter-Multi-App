import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword = ''; // Initialisé avec une chaîne vide

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange, title: Text(keyword)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'Key word'),
              onChanged: (value) {
                setState(() {
                  this.keyword = value;
                });
              },
              onSubmitted: (value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GalleryData(value)));
              },
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryData(this.keyword)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                child: Text('Get Data'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryData extends StatefulWidget {
  String keyWord;
  GalleryData(this.keyWord);
  @override
  _GalleryDataState createState() => _GalleryDataState();
}

class _GalleryDataState extends State<GalleryData> {
  List<dynamic> data = []; // Initialisé avec une liste vide
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 0;
  ScrollController _scrollController = ScrollController();
  dynamic dataGallery;
  List<dynamic> hits = []; // Initialisé avec une liste vide

  getData(String url) {
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if (dataGallery['totalHits'] % this.pageSize == 0)
          this.totalPages = (dataGallery['totalHits'] as int) ~/ this.pageSize;
        else
          this.totalPages =
              1 + ((dataGallery['totalHits'] as int) ~/ this.pageSize);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadData();
    this._scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          this.loadData();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void loadData() {
    // URL corrigée sur une seule ligne
    String url = "https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyWord}&page=$currentPage&per_page=$pageSize";
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.keyWord} : ${currentPage} / ${totalPages}'),
        backgroundColor: Colors.deepOrange,
      ),
      body: (dataGallery == null)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
          controller: _scrollController,
          itemCount: dataGallery == null ? 0 : hits.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                width: double.infinity,
                padding:
                EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
                child: Card(
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        hits[index]['tags'],
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
              Container(
                width: double.infinity,
                padding:
                EdgeInsets.only(right: 5, left: 5, top: 0, bottom: 0),
                child: Card(
                    child: Image.network(
                      hits[index]['previewURL'],
                      fit: BoxFit.fitWidth,
                    )),
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
              ),
            ]);
          }),
    );
  }
}