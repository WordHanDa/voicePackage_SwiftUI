import SwiftUI

struct backGroundSyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .fontWeight(.bold)
            .font(.title)
            .padding(.horizontal, 20)
            .background(Color.purple)
            .cornerRadius(40)
            .foregroundColor(.white)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.purple, lineWidth: 5)
            )
            .scaleEffect(configuration.isPressed ? 0.9:1.0)
    }
}

struct Box: Identifiable {
    var id: Int
    var title: String
}

struct ContentView: View {
    let boxes: [Box] = [
        Box(id: 1, title: "Hello, World"),
        Box(id: 2, title: "Hello"),
        Box(id: 3, title: "hello"),
        Box(id: 4, title: "...")
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(boxes) { box in
                    Button(action: {
                        print(box.id)
                    }) {
                        HStack {
                            Text(box.title)
                        }
                    }
                    .buttonStyle(backGroundSyle())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
