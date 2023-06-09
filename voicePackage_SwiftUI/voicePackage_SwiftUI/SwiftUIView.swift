//
//  SwiftUIView.swift
//  voicePackage_SwiftUI
//
//  Created by macbook pro on 2023/6/9.
//

import SwiftUI

struct SwiftUIView: View {
    let boxes: [Box] = [
        Box(1, title: "SwiftUIView", destination: SwiftUIView()),
        Box(2, title: "DetailView", destination: DetailView()),
        Box(3, title: "DetailView2", destination: SwiftUIView2())
    ]
    
    var body: some View {
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
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
