import 'package:http/http.dart' as http;

class QuizApiProvider {
  http.Client client = http.Client();
  Future<http.Response> getQuizData(int opcionMenu) async {
    try {
      String url = '';
      if (opcionMenu == 1) {
        url = "http://164.90.145.227/api/tablaunos/?format=json";
      }
      if (opcionMenu == 2) {
        url = "http://164.90.145.227/api/tabladoss/?format=json";
      }
      final response = await client.get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

QuizApiProvider quizApiProvider = new QuizApiProvider();
