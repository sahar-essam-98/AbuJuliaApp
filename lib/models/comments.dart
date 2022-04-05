class Comments{
  late String id ;
  late String userName ;
  late String content;
  late String product;

  Comments.fromMap(dynamic documentMap){
    userName= documentMap['userName'];
    content = documentMap['content'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['userName'] = userName;
    map['content'] = content;
    return map;

  }
}