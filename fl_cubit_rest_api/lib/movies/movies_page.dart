// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/movies/movies_cubit.dart';
import 'package:learn_flutter/movies/movies_model.dart' as mm;
import 'package:learn_flutter/movies/movies_model.dart';

class MoviesPageScreen extends StatefulWidget {
  const MoviesPageScreen({super.key});

  @override
  State<MoviesPageScreen> createState() => _MoviesPageScreenState();
}

class _MoviesPageScreenState extends State<MoviesPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Movies'),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            MoviesModel movies = state.movies;
            List<Result>? results = movies.results;

            // basic null
            // ? ?? !

            return ListView.builder(
                itemCount: results?.length,
                itemBuilder: (context, index) {
                  String? responSatu = results?[index].title ?? "-";
                  String? responDua =
                      results?[index].popularity.toString() ?? "-";
                  return Card(
                    child: ListTile(
                        title: Text(responSatu), leading: Text(responDua)),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
