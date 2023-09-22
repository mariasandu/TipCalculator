//
//  ContentView.swift
//  TipCalculator
//
//  Created by Maria Sandu on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enteredAmount: String = ""
    @State private var tipAmount: Double = 0
    @State private var totalAmount: Double = 0
    @State private var tipSlider: Double = 15
    
    var body: some View {
        VStack(spacing: 40) {
            
            billAmount
            
            sliderSection
            
            tipSection
                        
            totalSection
        }
        .padding (30)
    }
    
    private var billAmount: some View {
        VStack {
            Text ("Enter Bill Amount")
                .foregroundColor( .secondary)
            
            TextField("0.00", text: $enteredAmount)
                .font (.system(size: 70, weight: .semibold, design: .rounded))
                .keyboardType(.decimalPad)
                . multilineTextAlignment(.center)
        }
    }
    
    private var sliderSection: some View {
        VStack {
            Text("Tip: \(tipSlider, specifier: "%.0f")%")
            
            Slider(value: $tipSlider, in: 0...35, step: 1)
                .onChange(of: tipSlider) { _ in
                    guard let amount = Double (enteredAmount) else {
                        print("Invalid Entry")
                        return
                    }
                    
                    guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else {
                        print("Bill amount or tip cannot be negative")
                        return
                    }
                    
                    tipAmount = tip
                    totalAmount = amount + tipAmount
                }
        }
        
    }
    private var tipSection: some View {
        VStack {
            Text(tipAmount, format: .currency (code: "USD"))
                .font(.title.bold ())
            
            Text("Tip")
                .foregroundColor (.secondary)
                .font (.caption)
        }
        .padding (.top, 20)
    }
    
    private var totalSection: some View {
        VStack {
            Text (totalAmount, format: .currency (code: "USD"))
                .font (.title.bold ())
            
            Text ("Total")
                .foregroundColor (.secondary)
                .font (.caption)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

