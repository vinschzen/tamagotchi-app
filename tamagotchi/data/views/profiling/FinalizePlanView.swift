//
//  FinalizePlanView.swift
//  tamagotchi
//
//  Created by MacBook Air on 24/09/24.
//

import SwiftUI

struct FinalizePlanView: View {
    var body: some View {
        VStack{
            ZStack{
                Text("Hurray! 🎉 \n\nYou’ve selected \nyour plan! \n\nIt's time to \nmeet your \ncompanion!")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
                    .background(.maincolor)

                Button(action: {
                    
                }, label: {
                    Text("Click Here to Continue")
                        .underline()
                })
                .padding(.top, 500.0)
                .foregroundColor(.white)
                .font(.title)
                .fontWeight(.bold)
            }
            
        }
    }
}

#Preview {
    FinalizePlanView()
}
