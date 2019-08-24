import 'package:iad_advertiser/model/AdTimeInterval.dart';
import 'package:iad_advertiser/model/Billboard.dart';

class BillboardReservationUnit{
  Billboard billboard;
  AdTimeInterval adTimeInterval;

  BillboardReservationUnit(this.billboard, this.adTimeInterval);

  @override
  String toString() {
    return 'BillboardReservationUnit{billboard: $billboard, adTimeInterval: $adTimeInterval}';
  }


}