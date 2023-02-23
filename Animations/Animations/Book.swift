//
//  boy.swift
//  AlongStory
//
//  Created by giovanni russo on 19/02/23.
//

import SwiftUI

struct StoryLoadingView: View {
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.white)
//                .frame(width: 200, height: 250)
//                .shadow(radius: 10)
//
            VStack {
                if isLoading {
                    Text("Caricamento...")
                        .font(.headline)
                        .foregroundColor(.gray)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                        .scaleEffect(1.5)
                } else {
                    Image(systemName: "book.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.orange)
                        .frame(width: 80, height: 80)
                    Text("Storia in arrivo!")
                        .font(.headline)
                        .foregroundColor(.orange)
                }
            }
        }
        .onAppear {
            isLoading = true
            //you can manage the deadline time
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                isLoading = false
            }
        }
    }
}

struct book: View {
    var body: some View {
        StoryLoadingView()
    }
}



struct boy_Previews: PreviewProvider {
    static var previews: some View {
        book()
    }
}
