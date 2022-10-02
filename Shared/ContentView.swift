//
//  ContentView.swift
//  Shared
//
//  Created by Jasmean Fernando on 10/1/22.
//

import SwiftUI

struct ContentView: View
{
    //VARIABLES
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    @FocusState private var isInputActive: Bool
    
    private let tipPercentages = [10, 15, 20, 25, 30]
    
    //subTotal: if not declared, set to zero
    private var subTotal: Double { Double(checkAmount) ?? 0}
    
    //orderAmount: if not declared, set to zero
    private var subTotalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let orderAmount = Double(checkAmount) ?? 0
        
        return  orderAmount / peopleCount
    }
    
    //orderAmount: if not declared, set to zero
    private var tipValue: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        return orderAmount / 100 * tipSelection
    }
    
    //orderAmount: if not declared, set to zero
    private var tipValuePerPerson: Double { tipValue / Double(numberOfPeople) }
    
    private var totalAmountWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    private var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let amountPerPerson = totalAmountWithTip / peopleCount
        
        return amountPerPerson
    }
    
    //initializer for Picker -> Change color when a tip percentage is pressed by user
    init() {
        UISegmentedControl.appearance()
            .selectedSegmentTintColor = UIColor(.yellow)
    }
    
    var body: some View {
        //returns width of the screen
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 20) {
                CardView(cardLabelText: "SPLIT COST PER PERSON",
                         totalAmount: totalPerPerson,
                         subtotalAmount: subTotalPerPerson,
                         tipAmount: tipValuePerPerson)
                    .frame(width: geo.size.width, height: 100)
                
                CardView(cardLabelText: "TOTAL COST",
                         totalAmount: totalAmountWithTip,
                         subtotalAmount: subTotal,
                         tipAmount: tipValue)
                    .frame(width: geo.size.width, height: 100)
                
                Picker("Tip Percentage", selection: $tipPercentage) {
                    ForEach(0..<tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                TitleView(title: "BILL AMOUNT")
                
                HStack {
                    Text("$")
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                    TextField("Amount", text: $checkAmount)
                        .foregroundColor(.primary)
                        .font(.system(size: 60, weight: .black, design: .rounded))
                        .keyboardType(.decimalPad) //limits users to only enter numbers
                        .focused($isInputActive)
                    
                        .toolbar {
                            ToolbarItemGroup (placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputActive = false
                                }
                            }
                        }
                }
                TitleView(title: "SPLIT")
                GuestCountView(guestCount: $numberOfPeople)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

struct TitleView: View
{
    var title: String
    
    var body: some View
    {
        HStack(alignment: .center) {
            Text(title)
                .foregroundColor(.yellow)
                .fontWeight(.black)
            Spacer()
        }
    }
}
