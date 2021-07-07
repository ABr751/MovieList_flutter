import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_list_flutter/blocs/movie_bloc.dart';
import 'package:movie_list_flutter/blocs/movie_event.dart';
import 'package:movie_list_flutter/blocs/movie_state.dart';
import 'package:movie_list_flutter/models/movie.dart';
import 'package:movie_list_flutter/movie/movie_tile.dart';

class MovieList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  static const _pageSize = 20;

  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  late MaterialSearch searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _fetchPage();
    print("Hurrrrrrray......");
    super.initState();
  }

  _fetchPage() async {
    try {
      context.read<MovieBloc>().add(Fetch());
    } catch (error) {
      print("Uh oh......$error");
    }
  }

  void onSubmitted(String value) {
    setState(() {
      _scaffoldKey.currentState
          ?.showBottomSheet((context) => Text('You wrote !$value'));
    });
  }

  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "Romantic Comedy",
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
                context: context,
                delegate: MaterialSearch(_pagingController.itemList));
          },
        ),
      ],
    );

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: appBar,
        body: BlocConsumer<MovieBloc, MovieState>(
            listener: (context, movieState) {},
            builder: (context, movieState) {
              if (movieState is MovieSuccessState) {
                context.read<MovieBloc>().movies.addAll(movieState.movies);
              }
              return GridView.builder(
                controller: _scrollController
                  ..addListener(() {
                    if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent) {
                      context.read<MovieBloc>()..add(Fetch());
                    }
                  }),
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => MovieTile( context.read<MovieBloc>().movies[index]),
                itemCount: context.watch<MovieBloc>().movies.length,
              );
            }));
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

class MaterialSearch extends SearchDelegate {
  final movieBloc = MovieBloc();
  final List<Movie>? list;

  MaterialSearch(this.list);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            icon: Image(
              image: AssetImage("assets/images/search_cancel.png"),
              width: 14,
              height: 14,
            ),
            onPressed: () => query = '')
      ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Image(
        image: AssetImage("assets/images/back.png"),
        width: 14,
        height: 14,
      ),
      onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Container(
        child: GridView.count(
          crossAxisCount: 3,
          padding: EdgeInsets.only(left: 15, right: 15),
          children: searchResults(),
        ),
        color: Theme.of(context).backgroundColor,
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<MovieTile> tempList = <MovieTile>[];
    return Container(
      child: _buildSuggestions(),
      color: Theme.of(context).backgroundColor,
    );
  }

  Widget _buildSuggestions() {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: SizedBox(
          width: 45,
          height: 45,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
        )));
  }

  List<Widget> searchResults() {
    final temp = <Widget>[];
    print("initial list is :$list");
    list?.map((e) {
      if (e.name.contains(query)) {
        print(e.name);
        temp.add(MovieTile(e));
      }
    });
    print("query is :$query" + temp.toString());
    return temp;
  }
}
