

class Peliculas{
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null){return;}

    for(final item in jsonList)
    {
      //coge cada uno de los items mapeados y crea una película con el constructor Pelicula.fromJsonMap
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}


class Pelicula {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Pelicula({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Pelicula.fromJsonMap (Map<String, dynamic> json)
  {
    adult            = json["adult"];
    backdropPath     = json["backdrop_path"]; 
    genreIds         = json["genre_ids"].cast<int>(); 
    id               = json["id"]; 
    originalLanguage = json["original_language"]; 
    originalTitle    = json["original_title"]; 
    overview         = json["overview"]; 
    popularity       = json["popularity"] /1; 
    posterPath       = json["poster_path"]; 
    releaseDate      = json["release_date"]; 
    title            = json["title"]; 
    video            = json["video"]; 
    voteAverage      = json["vote_average"] /1; 
    voteCount        = json["vote_count"]; 
  } 


  getPosterIMG(){

    if(posterPath == null)
    {
      return "https://lh3.googleusercontent.com/proxy/ooRsEDqJaoGRgg-0H-NSRxco4LmeI4_h4XSGkJBXwMj5ZayraiQbeMT5qvXInJgvnOdiOXJQWkRMaSlFnMAQ5jynIy1bM4mhel169t7tzuV53w";
    }
    else
    {
    return "https://image.tmdb.org/t/p/w500/$posterPath";

    }

  }
}
 