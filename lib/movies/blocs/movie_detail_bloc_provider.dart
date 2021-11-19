import 'package:flutter/material.dart';

import 'movie_detail_bloc.dart';

export 'movie_detail_bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  final MovieDetailBloc bloc; // scoped access - recommended

  MovieDetailBlocProvider({Key? key, required Widget child})
      : bloc = MovieDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MovieDetailBloc of(BuildContext context) {
    var result = (context
        .dependOnInheritedWidgetOfExactType<MovieDetailBlocProvider>());
    assert(result != null, "No bloc found in context");
    return result!.bloc;
  }
}
