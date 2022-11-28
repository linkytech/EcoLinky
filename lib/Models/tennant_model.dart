class Tennant {
  int _id;
  String _slug;
  String _name;
  int _status;
  String _description;

  // construtor
  Tennant(
    this._id,
    this._slug,
    this._name,
    this._status,
    this._description,
  );

  // setter para o id
  set id(int id) => _id = id;

  // getters para todos
  int get id => _id;

  String get slug => _slug;

  String get name => _name;

  int get status => _status;

  String get description => _description;

  factory Tennant.fromJson(Map<String, dynamic> json) {
    return Tennant(
      json['id'],
      json['slug'],
      json['name'],
      json['status'],
      json['description'],
    );
  }
}
