//1. 창고데이터
import 'package:flutter/material.dart';
import 'package:flutter_blog/_core/constants/move.dart';
import 'package:flutter_blog/data/dto/response_dto.dart';
import 'package:flutter_blog/data/dto/user_request.dart';
import 'package:flutter_blog/data/model/user.dart';
import 'package:flutter_blog/data/repository/user_repository.dart';
import 'package:flutter_blog/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionStore {
  User? user;
  String? jwt;
  bool? isLogin;

  SessionStore();
}

//2. 창고

class SessionUser extends SessionStore {
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinDTO joinDTO) async {
    //1.통신
    //통신을 뭐받을지부터 적자
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinDTO);

    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.loginPage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text("회원가입실패")));
    }
  }
}

//3. 프로바이더
final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});
