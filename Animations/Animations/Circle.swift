//
//  book.swift
//  AlongStory
//
//  Created by giovanni russo on 19/02/23.
//


import SwiftUI

struct AnimatedCircleLoader: View {
    @State private var rotationAngle: Angle = .degrees(0)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 100, height: 140)
            Image(systemName: "circle.dashed")
                .foregroundColor(.black)
                .font(.system(size: 50))
                .rotationEffect(rotationAngle)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 3.5).repeatForever(autoreverses: false)) {
                rotationAngle = .degrees(360)
            }
        }
    }
}

struct circle: View {
    var body: some View {
        VStack {
            AnimatedCircleLoader()
                .padding()
            Text("Loading...")
        }
    }
}



struct book_Previews: PreviewProvider {
    static var previews: some View {
        circle()
    }
}
