import 'package:ttk/src/models/position.dart';

class Valve {
  late String serialNo;
  late String batchNo;
  late String mfgDate;
  late String expDate;
  late Position position;
  late String image;
  late String valveType;

  Valve(
      {this.serialNo = '',
        this.batchNo = '',
      this.mfgDate = '',
      this.expDate = '',
      this.valveType = '',
      required this.position,
      this.image = ''});
}