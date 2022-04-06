class Comments{
  late String id ;
  late String userName ;
  late String content;
  late String product;


  Comments( this.userName, this.content, this.product);

  Comments.fromMap(dynamic documentMap){
    id= documentMap['id'];
    userName= documentMap['userName'];
    content = documentMap['content'];
    product = documentMap ['product'];
  }

  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['id']= id;
    map['userName'] = userName;
    map['content'] = content;
    map['product'] = product;
    return map;

  }
}