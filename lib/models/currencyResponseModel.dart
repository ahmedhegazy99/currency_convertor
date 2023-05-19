class CurrencyResponse {
  bool? success;
  bool? timeseries;
  String? base;
  String? startDate;
  String? endDate;
  List<Rates>? ratesList;

  CurrencyResponse({this.success, this.timeseries, this.base, this.startDate, this.endDate,this.ratesList});

  fromJson(Map<String, dynamic> json) {
    timeseries = json['timeseries'];
    base = json['base'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    print("base from server : $base");

    //this is list of the dates
    //print("rates keys : " + json["rates"].keys.toList().toString());
/*
    //this is the key map for getting data from this set
    Map rates = json["rates"];
    print("rates keys with first Date: " + rates.keys.first);
    Map rateCurrency = rates.values.first;
    print("rates keys with first currency : " + rateCurrency.keys.first.toString());
    Map rateValue = rates.values.first;
    print("rates keys with first currency value : " + rateValue.values.first.toString());
*/
    ratesList = <Rates>[];
    json["rates"].forEach((key, value) {
      String date, cur, val;
      date = key;
      cur = value.keys.first.toString();
      val = value.values.first.toString();
      print("date : $date , cur : $cur , val : $val");
      ratesList!.add(Rates(date, cur, val));
    });
    print("rates list : " + ratesList.toString());
  }

}

class Rates {
  String date;
  String currency;
  String value;

  Rates(this.date, this.currency, this.value);
}
