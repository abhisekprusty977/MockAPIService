import Foundation

enum HTTPMethods: String {
    case get = "GET"
}

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
    var httpMethod: HTTPMethods? { get }
    var httpBody: Encodable? { get }
    var header: [String: String]? { get }
    var mockFileName: String { get }
}
