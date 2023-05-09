import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixapp/application/search/search_bloc.dart';
import 'package:netflixapp/domain/core/debounce/debounce.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
  });
  final _debouncer = Debouncer(milliseconds: 1 * 1000);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextField(
        onChanged: (value) {
          if (value.isEmpty) {
            return;
          }
          _debouncer.run(() {
            BlocProvider.of<SearchBloc>(context)
                .add(SearchMovie(movieQuery: value));
          });
          // BlocProvider.of<SearchBloc>(context)
          //     .add(SearchMovie(movieQuery: value));
        },
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          fillColor: Colors.grey[800],
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5),
          ),
          hintText: 'Enter text',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(top: 12, left: 5),
          suffixIcon: const Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
