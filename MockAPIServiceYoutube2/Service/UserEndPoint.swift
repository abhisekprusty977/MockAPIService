import Foundation

enum UserEndPoint {
    case fetchUsers
}
// MARK: Use this Base URL: https://jsonplaceholder.typicode.com/users
extension UserEndPoint: EndPointType {
    var baseURL: String {
        "https://jsonplaceholder.typicode.com/"
    }
    
    var path: String {
        "users"
    }
    
    var url: URL? {
        URL(string: baseURL + path)
    }
    
    var httpMethod: HTTPMethods? {
        .get
    }
    
    var httpBody: (any Encodable)? {
        nil
    }
    
    var header: [String : String]? {
        nil
    }
    
    var mockFileName: String {
        "Users"
    }
    
    
}

