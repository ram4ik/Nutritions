//
//  ContentView.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet: Bool = false
    
    var body: some View {
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("Add Nutrition")
                .foregroundColor(.black)
                .font(.largeTitle)
                .bold()
        })
        .sheet(isPresented: $showSheet, content: {
            NutritionsView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
