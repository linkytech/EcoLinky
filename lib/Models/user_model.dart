class User {
  int _id;
  String _name;
  String _cpf;
  String _email;
  String _password;
  // _latitude, _longitude, _photo

  // construtor
  User(this._id, this._name, this._cpf, this._email, this._password);

  // setter para o id
  set id(int id) => _id = id;

  // getters para todos
  int get id => _id;
  String get name => _name;
  String get cpf => _cpf;
  String get email => _email;
  String get password => _password;

  // para usarmos nos inserts/updates
  Map<String, dynamic> toMap() {
    return {
      'name': _name,
      'cpf': _cpf,
      'email': _email,
      'password': _password
    };
  }
}