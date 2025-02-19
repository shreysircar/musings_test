import 'package:dartz/dartz.dart';
import 'package:music/data/models/auth/create_user_req.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/auth.dart';
import 'package:music/service_locator.dart';

 class SignupUseCase implements Usecase<Either,CreateUserReq>{
@override
  Future<Either> call({CreateUserReq ? params}) async {
return sl<AuthRepository>().signup(params!);
  }

}
