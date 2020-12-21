/**
 If you’re trying to decide whether to use @State, @StateObject or @ObservedObect, there are two questions you can ask about the property you’re declaring:

 Is it a value type or a reference type? If you’re working with a value type, use @State.
 Should SwiftUI manage the lifecycle of the property? If you’re only using the object in the view the property is declared in, @StateObject works fine. But, if the object is created or used outside the view, then @ObservedObject is a better match.
 */
import SwiftUI

// swiftlint:disable multiple_closures_with_trailing_closure
struct MovieList: View {
  
  @StateObject var movieStore = MovieStore()
  @State private var isPresented = false
  // lets you use environment objects passed to a view or to any of its ancestor views.
  @EnvironmentObject var userStore: UserStore

  var body: some View {
    NavigationView {
      List {
        ForEach(movieStore.movies, id: \.title) {
          MovieRow(movie: $0)
        }
        .onDelete(perform: movieStore.deleteMovie)
      }
      .sheet(isPresented: $isPresented) {
        AddMovie(movieStore: movieStore, showModal: $isPresented)
      }
      .navigationBarTitle(Text("Fave Flicks"))
      .navigationBarItems(
        leading:
          NavigationLink(destination: UserView()) {
            Image(systemName: "person.fill")
          },
        trailing:
          Button(action: { isPresented.toggle() }) {
            Image(systemName: "plus")
          }
      )
    }
  }
}

struct MovieList_Previews: PreviewProvider {
  static var previews: some View {
    MovieList(movieStore: MovieStore())
  }
}
