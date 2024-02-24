class Apis {
  String kBaseUrl = "https://api.themoviedb.org/3";
  String imageAppendUrl = "https://image.tmdb.org/t/p/w500/";
  // String apiKey = "4b3d9c8dd660a5cb125983af6472c42b";
  String apiKey = "dc0f329be360784ff766c15327daf896";
  String authorization =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MDM0NmNkODcyMDMzZDU2MjhjMWM4OWEzMWRjODMyOSIsInN1YiI6IjYyODlkZTg2ZTI2N2RlMDA5ZDM2Y2I2MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5OEjSLS6joaIQWhjqHrfjWABCuygaLihKW7CljfxEGQ";
 late String topMovie;
  late String popularMovie;

  Apis() {
    topMovie = "$kBaseUrl/movie/top_rated?language=en-US&page=1";
    popularMovie = "$kBaseUrl/movie/popular";
    
  }

  // You can add more methods or functionality related to API handling here
}
