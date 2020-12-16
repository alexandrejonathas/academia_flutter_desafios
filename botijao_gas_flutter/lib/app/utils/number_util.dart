import 'package:intl/intl.dart';

class NumberUtil {
  static toReal(number) {
    var nf = NumberFormat('##,###,###,##0.00', 'pt_BR');
    return nf.format(number);
  }
}
