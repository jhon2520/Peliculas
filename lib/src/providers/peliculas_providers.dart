
import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart'; 
import 'package:http/http.dart' as http;

class PeliculasProvider {
  
  String _apiKey   = "a27fc2203f51a1bb39546fb877cdac6a";
  String _url      = "api.themoviedb.org";
  String _language = "es-ES";


  Future<List<Pelicula>> getEnCines() async{

    //forma fácil de generar URL

    final url = Uri.https(_url,"3/movie/now_playing",{

      "api_key": _apiKey,
      "language":_language,

    });

    //petición http, se instala el packete flutter http

    final resp = await http.get(url);
    
    //decodificar respuesta

    final decodedData = json.decode(resp.body);

    //tranformar la data del json en películas

    final peliculas = new Peliculas.fromJsonList(decodedData["results"]); 

    //ejemplo de mostrar el titulo de la segunda pelicula
    //print(peliculas.items[1].title);


    return peliculas.items; 
  }

}