

public struct Forage {
    static public func sendNumberCard(type: String,
                                      reusable: Bool,
                                      number: String) {
        let configuration = URLSessionConfiguration.af.default
        let session = Session(configuration: configuration)
        session.request(WebService.paymenMethod(card: PaymentMethodRequest(type: type,
                                                                           reusable: reusable,
                                                                           number: number)
        )).validate()
            .responseData { response in
                //TODO: Pase with codable to paymentReponse
            }
    }
}
