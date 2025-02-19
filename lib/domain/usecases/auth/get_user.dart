import 'package:dartz/dartz.dart';
import 'package:music/core/usecase/usecase.dart';
import 'package:music/domain/repository/auth/auth.dart';
import 'package:music/service_locator.dart';

 class GetUserUseCase implements Usecase<Either,dynamic>{
  @override
  Future<Either> call({params})  async{
return await  sl<AuthRepository>().getUser();
  }


}
