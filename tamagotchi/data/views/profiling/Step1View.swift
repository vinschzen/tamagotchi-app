//
//  Step1View.swift
//  tamagotchi
//
//  Created by MacBook Air on 19/09/24.
//

import SwiftUI


struct Step1View: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

#Preview {
    Step1View()
}
