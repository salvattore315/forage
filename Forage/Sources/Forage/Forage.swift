

public struct Forage {
    static public func sendNumberCard() {
        let configuration = URLSessionConfiguration.af.default
        let session = Session(configuration: configuration)
        session.request(WebService.paymenMethod())
            .validate()
            .responseData { response in
            }
    }
}
