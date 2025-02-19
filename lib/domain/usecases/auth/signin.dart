import 'package:dartz/dartz.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/data/models/auth/signin_user_req.dart';
import 'package:music/domain/repository/auth/auth.dart';
import 'package:music/service_locator.dart';

 class SigninUseCase implements Usecase<Either,SigninUserReq>{
@override
  Future<Either> call({SigninUserReq ? params}) async {
return sl<AuthRepository>().signin (params!);
  }

}
