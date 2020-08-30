//
//  NutritionsView.swift
//  Nutritions
//
//  Created by Ramill Ibragimov on 30.08.2020.
//

import SwiftUI
import CTPicker
import SDWebImageSwiftUI

struct NutritionsView: View, CTPicker {
    @State private var presentPicker = false
    @State private var tag = 1
    @State private var food: String = ""
    @State private var beverage: String = ""

    @StateObject private var groceriesVM = GroceriesViewModel()
    
    let ctpColors = CTPColors(headerBackgroundColor: .gray, headerTintColor: .white)
    let ctpStrings = CTPStrings(cancelBtnTitle: "Dismiss")
    
    @State var foodName = ""
    @State var foodImageURL = ""
    
    var body: some View {
        ZStack {
            VStack {
                
            }
            
            ZStack {
                NavigationView {
                    VStack {
                        Spacer()
                        Group {
                            Text(foodName)
                                .font(.title)
                                .lineLimit(3)
                                .multilineTextAlignment(.center)
                                .padding()
                        }
                        WebImage(url: URL(string: foodImageURL))
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                        CTPickerTextView(presentPicker: $presentPicker,
                                         fieldString: $food,
                                         placeholder: "Select a food",
                                         tag: $tag,
                                         selectedTag: 1)
                            .onChange(of: food) { _ in
                                getPosts()
                                        }
                    }
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .navigationTitle("Pick a nutrition")
                }
                
                if presentPicker {
                    
                        CTPickerView(presentPicker: $presentPicker,
                                     pickerField: $food,
                                     //items: foodArray,
                                     items: groceriesVM.foodArray,
                                     saveUpdates: saveUpdates,
                                     noSort: true,
                                     ctpColors: ctpColors,
                                     ctpStrings: ctpStrings)
                            .zIndex(1.0)
                    
                }
            }
            
        }
    }
    
    func saveUpdates(_ newItem: String) {

            groceriesVM.newFoodItem(newItem)
      
    }
    
    func getPosts() {
        Api().getPosts(username: "user", password: "password", searchItem: food) { (posts) in
            DispatchQueue.main.async {
                foodName = posts.the1.name
                foodImageURL = posts.the1.photo
            }
        }
    }
    
}

struct NutritionsView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionsView()
    }
}
