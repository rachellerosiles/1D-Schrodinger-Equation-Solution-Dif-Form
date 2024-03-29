//
//  Potential.swift
//  1D Schrodinger Equation Solution Dif Form
//
//  Created by PHYS 440 Rachelle on 3/29/24.
//

import Foundation

@Observable class Potential {
    
    var oneDPotentialArray = [Double]()
    
    // returns x and y for each V(x) = y
    var oneDPotentialXArray = [Double]()
    var oneDPotentialYArray = [Double]()
    
    var oneDPsiArray = [Double]()
    var oneDPsiPrimeArray = [Double]()
    var oneDPsi2PrimeArray = [Double]()
    
    func startPotential(xMin: Double, xMax: Double, xStep: Double) {
        
        oneDPotentialXArray.append(xMin)
        oneDPotentialYArray.append(1000000.0)
    }
    
    func finishPotential(xMin: Double, xMax: Double, xStep: Double) {
        
        oneDPotentialXArray.append(xMax)
        oneDPotentialYArray.append(1000000.0)
    }
    
    // set Psi(0) = 0
    // guess Psi'(0) = 1
    // calc Psi(x + del*x) = Psi(x) + del x* Psi'(x)
    //   and Psi'(x + del*x) = Psi'(x) + del x* (-2*m/hbar)* [En - V(x)] * Psi
    // cycle through each En in range
    //
    func Runge_Kutta4(energy: Double){
        let h2overM = Double(7.61996423107385308856)
        
        oneDPsiArray.removeAll()
        oneDPsiPrimeArray.removeAll()
        oneDPsi2PrimeArray.removeAll()
        
        oneDPsiArray.append(0.0)
        oneDPsiPrimeArray.append(1.0)
        oneDPsi2PrimeArray.append(-2.0/h2overM * (energy - oneDPotentialYArray[0])*oneDPsiArray[0])
        var xStep = oneDPotentialXArray[1] - oneDPotentialXArray[0]
        
        for i in 1 ..< oneDPotentialXArray.count {
            
            let psi2primeValue = -2.0/h2overM * (energy - oneDPotentialYArray[i-1])*oneDPsiArray[i-1]
            
            let psiPrimeValue = oneDPsiPrimeArray[i-1] + xStep * oneDPsi2PrimeArray[i-1]
            
            let psiValue = oneDPsiArray[i-1] + xStep * oneDPsiPrimeArray[i-1]
            
            oneDPsiArray.append(psiValue)
            oneDPsiPrimeArray.append(psiPrimeValue)
            oneDPsi2PrimeArray.append(psi2primeValue)
            
        }
        print(energy, oneDPsiArray[oneDPotentialXArray.count-1])
    }
}

