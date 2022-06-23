//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Daniel on 28.05.2022.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemname: String
    
    var body: some View {
        Image(systemName: systemname)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.roundedViewLength, height: Constants.roundedViewLength)
    }
}


struct RoundedImageViewFilled: View {
    var systemname: String
    
    var body: some View {
        Image(systemName: systemname)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.roundedViewLength, height: Constants.roundedViewLength)
            .background(
            Circle()
            .fill(Color(
          "ButtonFilledBackgroundColor"))
            )
            .overlay(
            Circle()
                .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.strokeWidth)
            )
    }
}

struct RoundRectTextView: View {
    
    var text: String
    
    var body: some View {
       Text(text)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.roundedVRectViewWidth, height: Constants.roundedVRectViewHight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.roundedVRectCornerRadius)
                .stroke(lineWidth: Constants.strokeWidth)
                .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct PreviewView: View {
    
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemname: "arrow.counterclockwise")
            RoundedImageViewFilled(systemname: "list.dash")
            RoundRectTextView(text: "100")
        }
    }
}
struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
