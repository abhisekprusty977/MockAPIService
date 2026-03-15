import SwiftUI

struct UserListView: View {
    
    @StateObject private var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                HStack(spacing: 16) {
                    Image(systemName: user.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.cyan)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.body)
                            .foregroundStyle(.link)
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}

#Preview {
    UserListView(viewModel: UserViewModel(service: MockApiService()))
}
