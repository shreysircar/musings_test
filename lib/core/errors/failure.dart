abstract class Failure {
  final String message;
  Failure(this.message);

  @override
  String toString() => message; // ✅ Ensures failures print useful info
}

class ServerFailure extends Failure {
  ServerFailure([String message = "Server Error"]) : super(message);
}





