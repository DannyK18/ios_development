//
//  ContentView.swift
//  SwiftUIList
//
//  Created by Daniel on 22.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.systemRed, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        navBarAppearance.setBackIndicatorImage(UIImage(systemName: "arrow.turn.up.left"), transitionMaskImage: UIImage(systemName: "arrow.turn.up.left"))
        UINavigationBar.appearance().tintColor = .black
    }
    var restaurants = [
        Restaurant(name: "Cafe Deadend", image: "cafedeadend"), Restaurant(name: "Homei", image: "homei"),
        Restaurant(name: "Teakha", image: "teakha"),
        Restaurant(name: "Cafe Loisl", image: "cafeloisl"),
        
        Restaurant(name: "Petite Oyster", image: "petiteoyster"), Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant"),
        Restaurant(name: "Po's Atelier", image: "posatelier"), Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery"),
        
        Restaurant(name: "Haigh's Chocolate", image: "haighschocolate"), Restaurant(name: "Palomino Espresso", image: "palominoespresso"),
        Restaurant(name: "Upstate", image: "upstate"),
        Restaurant(name: "Traif", image: "traif"),
        
        Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats"),
     Restaurant(name: "Waffle & Wolf", image: "wafflewolf"), Restaurant(name: "Five Leaves", image: "fiveleaves"), Restaurant(name: "Cafe Lore", image: "cafelore"),
        
        Restaurant(name: "Confessional", image: "confessional"), Restaurant(name: "Barrafina", image: "barrafina"), Restaurant(name: "Donostia", image: "donostia"), Restaurant(name: "Royal Oak", image: "royaloak"), Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen")
    ]
    
    var body: some View {
        NavigationView {
        List(restaurants) { restaurant in
            NavigationLink(destination: RestaurantDetailView(restaurant: restaurant)) {
//            BasicImageRow(restaurant: restaurant)
         FullImageRow(restaurant: restaurant)
            }
           }
        .navigationBarTitle("Restaurants", displayMode: .large)
        }
    }
}


struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 370)
                .cornerRadius(10)
                .overlay(
                Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.mode.wrappedValue.dismiss()
            }){
            Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                        .foregroundColor(.red)
                })
    }
}
struct Restaurant: Identifiable {
    var id = UUID()
     var name: String
    var image: String
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
