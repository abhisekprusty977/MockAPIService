import Testing
@testable import MockAPIServiceYoutube2

struct UserViewModelTests {

    private var sut: UserViewModel
    private let service = MockApiService()
    
    init() async throws {
        sut = UserViewModel(service: service)
    }
    
    @Test func testFetchUsersDataSuccess() async throws {
        await sut.fetchUsers()
        #expect(sut.isError == false)
        #expect(sut.users.count == 1)
        #expect(sut.users[0].id == 1)
        #expect(sut.users[0].name == "Abhisek Prusty")
        #expect(sut.users[0].email == "abhisekprusty977@gmail.com")
        #expect(sut.users[0].imageName == "y.circle.fill")
    }
    
    @Test func testFetchUsersErrorScenario() async throws {
        service.shouldShowError = true
        await sut.fetchUsers()
        #expect(sut.isError == true)
        #expect(sut.users.isEmpty)
        #expect(service.shouldShowError == false)
    }

}
