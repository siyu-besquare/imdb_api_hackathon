import 'package:http/http.dart' as http;
import 'package:imdb_api_hackathon/models/search_model.dart';

class SearchService {
  Future<SearchModel> fetchSearchInformation({String? titleName, String? genre}) async {
    const String apiKey = "k_8dgpz1mi";
    // k_2b0tzkax
    // k_mvigl067
    // k_8dgpz1mi

    final Uri url = Uri(
      scheme: 'https',
      host: 'imdb-api.com',
      path: 'API/AdvancedSearch/$apiKey',
      queryParameters: {'title': titleName, 'genres': genre},
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      print("service: ${url}");
      return SearchModel.fromJson(response.body);
    }
    else{
      throw Exception("Failed to load weather information.");
    }
  }
}