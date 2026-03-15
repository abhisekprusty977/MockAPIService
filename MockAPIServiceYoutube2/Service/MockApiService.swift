import Foundation

final class MockApiService: Services {

    var shouldShowError: Bool = false
    
    func request<T>(type: any EndPointType) async throws -> T where T : Decodable, T : Encodable {
        defer { shouldShowError = false }
        if shouldShowError {
            throw NSError(
                domain: "MockAPIService",
                code: 500,
                userInfo: [NSLocalizedDescriptionKey: "Mock API Failure"]
            )
        }else {
            return try loadJson(filename: type.mockFileName)
        }
    }
}

extension MockApiService {

    func loadJson<T: Decodable>(filename fileName: String) throws -> T {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            throw DataError.invalidURL
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

}
