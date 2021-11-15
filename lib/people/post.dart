class Post {
  int _userId;
  int _id;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  Post.fromJson(Map<String, dynamic> site)
      : _userId = site['userId'],
        _id = site['id'],
        _title = site['title'],
        _body = site['body'];

  Map<String, dynamic> toJson() => {
        'userId': _userId,
        'id': _id,
        'title': _title,
        'body': _body,
      };

  String get title => _title;
}