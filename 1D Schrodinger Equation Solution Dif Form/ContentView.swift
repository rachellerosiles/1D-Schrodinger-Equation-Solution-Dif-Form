//
//  ContentView.swift
//  1D Schrodinger Equation Solution Dif Form
//
//  Created by PHYS 440 Rachelle on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var minEnergy = 0.0
    @State var maxEnergy = 25.0
    @State var xMin = 0.0
    @State var xMax = 10.0
    @State var xStep = 0.005
    @State var xMaxString = "10.0"
    @State var maxEnergyString = "25.0"
    
    @State var potentialModel = Potential()
    
    var body: some View {
        HStack{
            VStack(alignment: .center) {
                Text("Range of nonzero potential starting from zero: ")
                    .font(.callout)
                    .bold()
                TextField("length", text: $xMaxString)
                    .padding()
            }
            .padding(.top, 5.0)
            
            VStack(alignment: .center) {
                Text("Energy range starting at zero:")
                    .font(.callout)
                    .bold()
                TextField("max energy", text: $maxEnergyString)
                    .padding()
            }
            
            Button("Return V(x)", action: {self.calculatePotential()})
            
            .padding(.top, 5.0)
        }
    }
    
    func calculatePotential(){
        xMax = Double(xMaxString) ?? 10.0
        maxEnergy = Double(maxEnergyString) ?? 25.0
        
        getPotential(potential: potentialModel, potentialType: "Linear Well", xMin: xMin, xMax: xMax, xStep: xStep)
        
        /*for i in 0 ..< potentialModel.oneDPotentialXArray.count{
            print(potentialModel.oneDPotentialXArray[i], potentialModel.oneDPotentialYArray[i])
        }
         */
        
        for energy in stride(from: 0.0, through: maxEnergy, by: 0.05) {
            
            potentialModel.Runge_Kutta4(energy: energy)
        }
        
    }
    
}

