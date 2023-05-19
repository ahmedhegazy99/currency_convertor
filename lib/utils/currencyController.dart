import 'package:currency_convertor/models/currencyResponseModel.dart';
import 'package:currency_convertor/utils/services.dart';
import 'package:currency_convertor/utils/utilFunction.dart';
import 'package:dio/dio.dart';

class CurrencyController {

  late CurrencyResponse r = new CurrencyResponse();

  String currentRate = "0";
  Future<String> getCurrency(String base, String desired) async {
    String cD = getDate();
    currentRate = await getCurrencyF(base, desired, cD, cD);
    return currentRate;
  }

  List<Rates> get getRates{
    if (r.ratesList != null)
      return r.ratesList!;
    else
      return [Rates("", "", "value")];
  }

  Future<String> getCurrencyF(String base, String desired, String startDate, String endDate) async {
    String cR = "0";
    r = new CurrencyResponse();

    print("from : $base  ::  to : $desired");

    Response response = await Services.get(base.toUpperCase(), desired.toUpperCase(), startDate, endDate);
    print("the response :  ${response.data}");

    r.fromJson(response.data);
    cR= r.ratesList!.last.value;
    print("currency rate : $cR");

    return cR;
  }
}