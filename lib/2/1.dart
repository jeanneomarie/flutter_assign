import 'dart:convert';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

/*void main() {
  get('https://yts.mx/api/v2/list_movies.json').then((Response response) {
    final Map<String, dynamic> map = jsonDecode(response.body);
    print(map["data"]["movies"][0]["title"]);
  });
}*/

/*Future<void> main() async {
  final Response response = await get('https://yts.mx/api/v2/list_movies.json');
  final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  final List<dynamic> moviesList = jsonResponse['data']['movies'];
  for (int i = 0; i < moviesList.length; i++) {
    print(moviesList[i]['title']);
  }
}*/

Future<void> main() async {
  final Response response = await get('https://yts.mx/api/v2/list_movies.json');
  final Map<String, dynamic> map = jsonDecode(response.body);
  final Map<String, dynamic> data = map['data'];
  final List<dynamic> movies = data['movies'];

  for (int i = 0; i < movies.length; i++) {
    print(movies[i]['title']);
  }

  final List<Movie> result = movies.map((dynamic item) => Movie.fromJson(item)).toList();

  print(result);
}

class Movie {
  const Movie({
    @required this.title,
    @required this.year,
    @required this.summary,
    @required this.genres
  });

  Movie.fromJson(dynamic item)
  : title = item['title'],
    year = item['year'],
    summary = item['summary'],
    genres = List<String>.from(item['genres']);

  final String title;
  final int year;
  final String summary;
  final List<String> genres;

  @override
  String toString() {
    return 'Movie{title: $title, year: $year, summary: $summary, genres: $genres}';
  }
}
