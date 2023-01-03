//
//  ProfileView.swift
//  WishApp
//
//  Created by Marcus Moore on 12/28/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color("Background")
                .ignoresSafeArea()
            Text("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
