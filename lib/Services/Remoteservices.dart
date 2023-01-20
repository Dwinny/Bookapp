import 'package:bookapp/models/Booksapp.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<Books?> getBooks() async {
    var client = http.Client();

    var uri = Uri.parse(
        'api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=ApMg1MgBDinfJ2jx4eos57rqmu8QsYMH');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return booksFromJson(json);
    }
  }
}
