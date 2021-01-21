import 'package:http/http.dart' as http;
class CardService {

    Future<void> dataGet() async{
      var response = await http.post("https://easyswitchgroup.com/esmerchant/", body: {

      });

      print(response);

    }
}