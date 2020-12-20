// https://www.raywenderlich.com/11781349-understanding-data-flow-in-swiftui#toc-anchor-014
/**
 To use an environment object, you need to do the following:
 Create a class conforming to ObservableObject.
 Have at least one variable in the class with the @Published property wrapper to trigger any observers to update, or manually provide an objectWillChange publisher as required by ObservableObject.
 Pass an instance of the observable class to a view by using the environmentObject() view modifier when creating the view.
 */
import Combine

class UserStore: ObservableObject {
  // The @Published property wrapper is what triggers any updates in observers of an ObservableObject
  @Published var currentUserInfo: UserInfo?
  
}
