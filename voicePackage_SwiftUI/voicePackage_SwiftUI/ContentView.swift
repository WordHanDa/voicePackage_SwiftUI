import SwiftUI

struct backGroundSyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .greatestFiniteMagnitude)
            .fontWeight(.bold)
            .font(.title)
            .padding(.horizontal, 0.0)
            .background(Color.purple)
            .cornerRadius(40)
            .foregroundColor(.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.purple, lineWidth: 5)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct Box: Identifiable {
    var id: Int
    var title: String
    var destination: AnyView
    
    init<T: View>(_ id: Int, title: String, destination: T) {
        self.id = id
        self.title = title
        self.destination = AnyView(destination)
    }
}


struct ContentView: View {
    let boxes: [Box] = [
        Box(1, title: "SwiftUIView", destination: SwiftUIView()),
        Box(2, title: "DetailView", destination: DetailView()),
        Box(3, title: "DetailView2", destination: SwiftUIView2())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(boxes) { box in
                        Button(action: {
                            // Handle button action here if needed
                            print(box.id)
                        }) {
                            NavigationLink(destination: box.destination) {
                                HStack {
                                    Text(box.title)
                                }
                            }
                        }
                        .buttonStyle(backGroundSyle())
                    }
                }
            }
            .navigationTitle("語音包")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
