import 'package:music/domain/entities/auth/user.dart';

class UserModel{

String? imageURL;
String ? fullName;
String? email;

UserModel({
this.imageURL,
this.email,
this.fullName
}
);

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['name'];
email=data['email'];
  }
}

extension UserModelX on UserModel {
 
 UserEntity toEntity() {
    return UserEntity(
email: email,
fullName: fullName,
imageURL: imageURL
    );
  }
}



