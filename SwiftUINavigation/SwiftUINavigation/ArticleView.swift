//
//  ArticleView.swift
//  SwiftUINavigation
//
//  Created by Daniel on 23.06.2022.
//

import SwiftUI

struct ArticleView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var article: Article
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                    Image(article.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                Group {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.black)
                        .lineLimit(3)
                        .padding(.bottom, 0)
                    
                    Text("By \(article.author)".uppercased())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 0)
                    
                    Text(article.content)
                        .font(.subheadline)
                        .font(.body)
                        .padding()
                        .lineLimit(1000).multilineTextAlignment(.leading)
                }
                .padding(.bottom, 0)
                .padding(.horizontal)
                
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "chevron.left.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.white)
        }))
    }
}


struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ArticleView(article: articles[0])
        }
    }
}
