//
//  CardView.swift
//  WishApp
//
//  Created by Marcus Moore on 12/29/22.
//

import SwiftUI

struct CardView: View {    
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<Item>
    @Environment(\.managedObjectContext) var moc
    
    var itemName: String
    var itemPrice: String
    var itemPicture: Data?
    var itemLink: String
    var itemCurr: String
    var itemDesc: String
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    var body: some View {
        ZStack{
            VStack {
                //Zstack for the label of the wishlist item
                ZStack{
                    Capsule()
                        .fill(Color.blue)
                        .opacity(0.5)
                    
                    VStack(alignment: .leading){
                        Text("Name: " + itemName)
                        HStack{
                            Text("Price: ")
                            Text(Double(itemPrice)!, format: .currency(code: itemCurr))
                        }
                        
                    }
                }
                .frame(width: UIScreen.screenWidth - 200, height: UIScreen.screenHeight /  15)
                .padding(10)
                
                ZStack{
                    if(itemPicture == nil){
                        Image("noImage")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }else {
                        Image(uiImage: UIImage(data: itemPicture!)!)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
                .padding(15)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(itemName: "Funko", itemPrice: "25", itemPicture: nil, itemLink: "", itemCurr: "USD", itemDesc: "")
    }
}
