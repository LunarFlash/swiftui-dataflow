import SwiftUI

struct UserView: View {
  
  @State private var username = ""
  @State private var favoriteGenre = ""
  @EnvironmentObject var userStore: UserStore

  /*
   like @EnvironmentObject in one way: both are shared across a view hierarchy. The difference is that you can add anything as an environment object, but environment values are more like key-value pairs.
   While both @EnvironmentObject and @Environment share the environment, they serve very different purposes. You usually use @EnvironmentObject to manage dependencies in your app. SwiftUI uses @Environment as a way to manage settings for views and their children.
   Each view comes with environment values you can use to change the behavior of views in the hierarchy.
   */
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    NavigationView{
      Form {
        Section(header: Text("User Name")) {
          // Passes userName as a binding to a TextField.
          TextField("User Name", text: $username)
        }
        Section(header: Text("Favorite Genre")) {
          GenrePicker(genre: $favoriteGenre)
        }
      }
    }
    .navigationBarTitle(Text("\(username) Info"), displayMode: .inline)
    .navigationBarItems(
    trailing:
      Button(action: updateUserInfo) {
        Text("Update")
      }
    )
    .onAppear {
      username = userStore.currentUserInfo?.username ?? ""
      favoriteGenre = userStore.currentUserInfo?.favoriteGenre ?? ""
    }
  }
  
  func updateUserInfo() {
    let newUserInfo = UserInfo(username: username, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
    presentationMode.wrappedValue.dismiss()
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
