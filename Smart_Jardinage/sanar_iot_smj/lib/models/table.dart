import 'package:sanar_iot_smj/db/database_helper.dart';


class TableJardin {
  int tableId;
  String tableName;
  String tableDevices;
  String tableCulture;

  TableJardin(this.tableId,this.tableName,this.tableDevices, this.tableCulture);

  TableJardin.map(Map<String,dynamic> obj){
    this.tableId = obj['tableId'];
    this.tableName = obj['tableName'];
    this.tableDevices=obj['tableDevices'];
    this.tableCulture= obj['tableCulture'];
  }

  Map<String, dynamic> toMap(){
   return{
     DatabaseHelper.tableId:tableId,
     DatabaseHelper.tableName:tableName,
     DatabaseHelper.tableDevices:tableDevices,
     DatabaseHelper.tableCulture:tableCulture
   };
  }

}
