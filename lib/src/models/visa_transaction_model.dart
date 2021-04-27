class VisaResponseModel {
  String termUrl;
  String acsUrl;
  String paReq;
  String eciFlag;
  String paymentId;
  String amount;
  String mD;
  String transactionRef;
  String transactionId;

  VisaResponseModel(
      {this.termUrl,
      this.acsUrl,
      this.paReq,
      this.eciFlag,
      this.paymentId,
      this.amount,
      this.mD,
      this.transactionRef,
      this.transactionId});

  factory VisaResponseModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return VisaResponseModel(
        termUrl: parsedJson["TermUrl"],
        amount: parsedJson["amount"],
        transactionRef: parsedJson["transactionRef"],
        transactionId: parsedJson["transactionId"],
        acsUrl: parsedJson["ACSUrl"],
        eciFlag: parsedJson["eciFlag"],
        mD: parsedJson["MD"],
        paReq: parsedJson["PaReq"],
        paymentId: parsedJson["paymentId"]);
  }
}
