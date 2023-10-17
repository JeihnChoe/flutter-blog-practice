import 'package:dio/dio.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';

class UserRepository {
  Dio dio = Dio();

  Future<ResponseDTO> fetchJoin(JoinDTO joinDTO) async {
    try {
      print("통신 실행됨?");
      //1. 뭘받을지적기 response
      //2. 어디다갖다줄지 오른쪽에 적기 : dio~~~~~~
      final response = await dio.post(
        "http://192.168.0.79:8080/join",
        data: joinDTO.toJson(),
      );
      //3. 뭐받았지? 받은거 파싱해줘야하는데 형태가 어떻게생겼는지모르겠음? 알아야지 api문서에적혀있음
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //4. responseDTO 는 그럼 뭐야? 이제 response에서 data만 꺼내서 넣은거임.
      responseDTO.data = User.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(-1, "중복되는 유저명입니다.", null);
    }
  }
}
