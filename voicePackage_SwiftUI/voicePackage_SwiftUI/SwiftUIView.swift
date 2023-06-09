//
//  SwiftUIView.swift
//  voicePackage_SwiftUI
//
//  Created by macbook pro on 2023/6/9.
//

import SwiftUI

struct V_Box: Identifiable {
    var id: Int
    var title: String
}

struct SwiftUIView: View {
    let boxes: [V_Box] = [
        V_Box(id: 1, title: "Hello, World"),
        V_Box(id: 2, title: "Hello"),
        V_Box(id: 3, title: "hello")
        ]
    var body: some View {
        NavigationStack{
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
            .navigationTitle("國棟")
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
