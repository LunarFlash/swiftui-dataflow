/**
 A state property is a source of truth, while a binding is a reference to another property — usually a state property declared elsewhere. A binding lets you reference and update its source of truth.
 */

import SwiftUI

struct GenrePicker: View {
  
  @Binding var genre: String
  
  var body: some View {
    Picker(selection: $genre, label: Spacer(), content: {
      ForEach(Movie.possibleGenres, id: \.self) {
        Text($0)
      }
    })
    .pickerStyle(WheelPickerStyle())
  }
}

struct GenrePicker_Previews: PreviewProvider {
  static var previews: some View {
    GenrePicker(genre: .constant("Action"))
  }
}
