//
//  ContentView.swift
//  ToastMessage
//
//  Created by Federico on 26/10/2021.
//

import SwiftUI
import SimpleToast

struct ContentView: View {
    @State private var showToast = false
    @State private var value = 0
    
    private let toastOptions = SimpleToastOptions(
        alignment: .top,
        hideAfter: 2,
        backdropColor: Color.black.opacity(0.2),
        animation: .default,
        modifierType: .slide
        
    )
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Show toast") {
                withAnimation {
                    showToast.toggle()
                }
            }
            Text("\(value)")
        }
        .simpleToast(isPresented: $showToast, options: toastOptions, onDismiss: {
            value += 1
        }) {
            HStack {
                Image(systemName: "leaf.fill")
                Text("Remember to take a break!").bold()
            }
            .padding(20)
            .background(Color.green.opacity(0.8))
            .foregroundColor(Color.white)
            .cornerRadius(14)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
