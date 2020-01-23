class Knowledge_txt{
  String knowledge_id;
  String date;
  String title;
  String description;
  String example;
  Knowledge_txt({this.knowledge_id,this.date,this.title,this.description,this.example});
  factory Knowledge_txt.fromJson(dynamic json)=>Knowledge_txt(
    knowledge_id:json['knowledge_id'],
    date:json['date'],
    title:json['title'],
    description:json['description'],
    example:json['example']
  );


  @override
  String toString() {
    // TODO: implement toString
    return "$knowledge_id $title";
  }
}