import '../../allpackages.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'http://ldap.cruzzesolutions.in/api/';

  Future<List<dynamic>> getData(endpoint) async {
    var data = await http.get(Uri.parse(baseUrl + endpoint));
    var response = json.decode(data.body);
    print(response);
    return response;
  }

  Future<dynamic> postData(endpoint, queryParamater) async {
    var data = await http.post(Uri.parse(baseUrl + endpoint),
        body: jsonEncode(queryParamater));
    var response = jsonDecode(data.body);
    print(response);
    return response;
  }
}
