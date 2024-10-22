//
//  AnimatedImage.swift
//  tamagotchi
//
//  Created by MacBook Air on 23/09/24.
//

import Foundation
import SwiftUI

struct AnimatedImage: View {
    
    @State var name:String
    @State var dir:String
    
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(height: 400, alignment: .center)
            .onAppear(perform: timer)
    }
    
    func timer(){
        
        var index = 1
        _ = Timer.scheduledTimer(withTimeInterval: 0.75, repeats: true) { (Timer) in
            
            name = dir + "\(index)"
            
            index += 1
                
            if (index > 9){
                index = 1
                
                
            }
        }
    }
    
    
}
