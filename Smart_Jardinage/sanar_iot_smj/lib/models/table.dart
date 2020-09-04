class Table {
  String device_id;
  String tableName;
  String cultureType;

  Table(this.device_id, this.tableName, this.cultureType);

  Table.map(dynamic obj){
    this.device_id = obj['deviceId'];
    this.tableName = obj['tableName'];
    this.cultureType = obj['cultureType'];
  }

  Map <String, dynamic> toMap(){

    var map  = new Map<String,dynamic>();
    map['deviceId'] =this.device_id;
    map['tableName'] =this.tableName;
    map['cultureName'] =this.cultureType;
    return map;

  }

}