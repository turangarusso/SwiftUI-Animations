//
//  Moon.swift
//  AlongStory
//
//  Created by giovanni russo on 19/02/23.
//



import SwiftUI

struct Moon: View {
    @State private var isLoading = false
    @State private var stars: [Star] = []
    
    var body: some View {
        ZStack {
            
            Color.black
            Image("background")
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.black)
//                .frame(width: 200, height: 200)
//                .shadow(radius: 10)
            
            ForEach(stars, id: \.rotation) { star in
                Image("lilstar")
                    .resizable()
                
                    .frame(width: 50, height: 50)
                    .cornerRadius(5)
                    .rotationEffect(.degrees(star.rotation))
                    .offset(x: star.position.x, y: star.position.y)
            }
            VStack {
                ZStack {
                    
                   
                    Image(systemName: "moon.stars.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.yellow)
                        .frame(width: 80, height: 80)
                        .shadow(color: .black, radius: 8)
                        .padding(.bottom, 60)

                        .offset(x: isLoading ? 50 : -70, y: 0)
                        .animation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true), value: isLoading)
                    
                    Image(systemName: "cloud.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 8)

                        .frame(width: 100, height: 100)
                        .offset(x: isLoading ? -70 : 50, y: 0)
                        .animation(Animation.linear(duration: 3.0).repeatForever(autoreverses: true), value: isLoading)
                    
                }
                Text("Caricamento...")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
        }
        .onAppear {
            withAnimation {
                isLoading = true
            }
           
            generateStars()
            startStarsAnimation()
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
    
    func generateStars() {
        for i in 1...6 {
            let x = Double.random(in: -500...500)
            let y = Double.random(in: -500...500)
            let rotation = Double.random(in: 0...360)
            let star = Star(position: CGPoint(x: x, y: y), rotation: rotation)
            stars.append(star)
        }
    }
    
    func startStarsAnimation() {
        for index in 0..<stars.count {
            //let delay = Double.random(in: 2...20)//unused
            //let speed = Double.random(in: 2.0...5.0)
            let distance = Double.random(in: 0...0)//0...150
            let angle = Double.random(in: 0...180)
            let radians = angle * .pi / 180
            let x = distance * cos(radians)
            let y = distance * sin(radians)
            let position = CGPoint(x: x, y: -y)
            
            withAnimation(Animation.linear(duration: 10.0).delay(0.0).repeatForever(autoreverses: true)) {
                stars[index].position = position
            }
        }
    }
}

struct Star {
    var position: CGPoint
    var rotation: Double
}

struct Calderon_Previews: PreviewProvider {
    static var previews: some View {
        Moon()
    }
}
