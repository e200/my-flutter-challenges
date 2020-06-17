import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(InfiniteScroll());
}

class InfiniteScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinite Scroll',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _http = Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );

  final List<Map<String, dynamic>> _posts = [];

  int _page = 1;
  int _limit = 10;

  ScrollController _scrollController;

  @override
  void initState() {
    _setupScrollController();

    _fetch();

    super.initState();
  }

  void _setupScrollController() {
    _scrollController = ScrollController();

    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent) {
      _page++;

      _fetch();
    }
  }

  _fetch() {
    _http.get('/posts?_start=$_page&_limit=$_limit')
      .then((response) {
        final _fetchedPosts = (response.data as List)
          .map((_user) => {
            'id': _user['id'],
            'title': _user['title'],
            'body': 'body',
          })
          .toList();

        setState(() {
          _posts.addAll(_fetchedPosts);
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts: ${_posts.length}'),
      ),
      body: Builder(
        builder: (context) {
          if (_posts.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            itemBuilder: (BuildContext context, int index) {
              if (index == _posts.length) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              } else {
                final _post = _posts[index];

                return ListTile(
                  title: Text(
                    _post['title'],
                  ),
                  subtitle: Text(
                    _post['body'],
                  ),
                );
              }
            },
            itemCount: _posts.length + 1,
          );
        },
      ),
    );
  }
}
