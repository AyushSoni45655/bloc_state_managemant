import 'package:api_bloc/data/remote/api/modal/modal.dart';
import 'package:api_bloc/utility/utild.dart';
import 'package:http/http.dart' as http;
class PhotosRepository{
  final String url = "https://jsonplaceholder.typicode.com/photos";
  Future<List<PhotosModal>> fetchPhotos()async{
    try{
      final responce = await http.get(Uri.parse(url));
      if(responce.statusCode == 200){
        return photosModalFromJson(responce.body);
      }
      else{
        throw Exception ("Load to failed");
      }
    }catch(e){
      throw Exception("Error : $e");
    }
  }
}