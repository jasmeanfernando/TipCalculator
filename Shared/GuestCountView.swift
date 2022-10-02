//
//  GuestCountView.swift
//  TipCalculator
//
//  Created by Jasmean Fernando on 10/1/22.
//

import SwiftUI

struct GuestCountView: View
{
    //VARIABLES
    @Binding var guestCount: Int
    
    var body: some View
    {
        HStack(spacing: 20)
        {
            //MINUS BUTTON
            Button
            {
                if guestCount > 1 {
                    guestCount -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
                    .foregroundColor(.yellow)
                    .font(.system(.title, design: .rounded))
            }
            
            //NUMBER OF GUESTS
            Text("\(guestCount)")
                .foregroundColor(.primary) //light theme->dark theme
                .font(.system(size: 40, weight: .black, design: .monospaced))
            
            //PLUS BUTTON
            Button {
                guestCount += 1
            } label: {
                Image(systemName: "plus.circle")
                    .foregroundColor(.yellow)
                    .font(.system(.title, design: .rounded))
            }
        }
    }
}

struct GuestCountView_Previews: PreviewProvider {
    static var previews: some View {
        GuestCountView(guestCount: .constant(1))
    }
}
