//
//  CardView.swift
//  TipCalculator
//
//  Created by Jasmean Fernando on 10/1/22.
//

import SwiftUI

struct CardView: View
{
    //VARIABLES
    var cardLabelText = "";
    var totalAmount = 48.85;
    var subtotalAmount = 42.48;
    var tipAmount = 6.37;
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: 0)
        {
            Text(cardLabelText)
                .foregroundColor(.yellow)
                .fontWeight(.black)
        }
        
        ZStack
        {
            Rectangle()
                .foregroundColor(.indigo)
                .cornerRadius(20)
            
            //TOTAL AMOUNT, SUBTOTAL, TIP
            HStack
            {
                Spacer()
                
                //TOTAL AMOUNT
                Text("$\(totalAmount, specifier: "%.2f")")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .black, design: .monospaced))
                    .fontWeight(.black)
                
                Spacer()
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(width: 3, height: 100)
                
                Spacer()
                
                //SUBTOTAL, TIP
                VStack(alignment: .leading, spacing: 10)
                {
                    //SUBTOTAL
                    VStack(alignment: .center) {
                        Text("SUBTOTAL")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.medium)
                        Text("$\(subtotalAmount, specifier: "%.2f")")
                            .font(.system(.body, design: .monospaced))
                            .fontWeight(.black)
                    }
                    
                    //TIP
                    VStack(alignment: .center)
                    {
                        Text("TIP")
                            .font(.system(.caption, design: .rounded))
                            .fontWeight(.medium)
                        Text("$\(tipAmount, specifier: "%.2f")")
                            .font(.system(.body, design: .monospaced))
                            .fontWeight(.black)
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
            }
            .padding(5)
        }
    }
}

struct CardView_Previews: PreviewProvider
{
    static var previews: some View
    {
        CardView(cardLabelText: "SPLIT TOTAL PER PERSON")
            .frame(width: 300, height: 150)
    }
}
