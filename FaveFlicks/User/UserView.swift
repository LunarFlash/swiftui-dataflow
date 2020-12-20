import SwiftUI

struct UserView: View {
  
  @State private var username = ""
  @State private var favoriteGenre = ""
  
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
  }
  
  func updateUserInfo() {
    
  }
}

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
