//
//  ContentView.swift
//  convertify
//
//  Created by Sebouh Mazloumian on 15.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var unit = 4
    @State private var outputUnit = 5
    @State private var value = "0"

    let units = ["inch", "feet", "mile", "cm", "m", "km"]

    var outputValue: Double {
        let input = Double(value) ?? 0
//      CM VALUE
        var source: Double = 0
        var outSource: Double = 0
        
        if input != 0 {
//          convert any input to CM
            switch units[unit] {
            case "inch":
                source = input / 0.39370
            case "feet":
                source = input / 0.032808
            case "mile":
                source = input / 0.0000062137
            case "cm":
                source = input * 1
            case "m":
                source = input / 0.01
            case "km":
                source = input * 100000
            default:
                source = 0
            }
            
            switch units[outputUnit] {
            case "inch":
                outSource = source * 0.39370
            case "feet":
                outSource = source * 0.032808
            case "mile":
                outSource = source * 0.0000062137
            case "cm":
                outSource = source * 1
            case "m":
                outSource = source / 100
            case "km":
                outSource = source / 100000
            default:
                outSource = 0
            }
        }
        
        return outSource
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("unit", selection: $unit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())

                    TextField("input", text: $value)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Output Unit")) {
                    Picker("output unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Text("\(outputValue)\(units[outputUnit])")
                }
            }
            .navigationTitle("Convertify")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
