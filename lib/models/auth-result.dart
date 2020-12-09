class AuthResult {
  String idToken;
  String email;
  String refreshToken;
  String expiresIn;
  String localId;
  DateTime expiryTime;

  AuthResult(
      {this.idToken,
      this.email,
      this.refreshToken,
      this.expiresIn,
      this.localId});

  AuthResult.fromJson(Map<String, dynamic> json) {
    idToken = json['idToken'];
    email = json['email'];
    refreshToken = json['refreshToken'];
    expiresIn = json['expiresIn'];
    localId = json['localId'];
    expiryTime = DateTime.now().add(Duration(seconds: int.parse(expiresIn)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idToken'] = this.idToken;
    data['email'] = this.email;
    data['refreshToken'] = this.refreshToken;
    data['expiresIn'] = this.expiresIn;
    data['localId'] = this.localId;
    return data;
  }
}
