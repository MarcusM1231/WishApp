//
//  MyListView.swift
//  WishApp
//
//  Created by Marcus Moore on 12/28/22.
//

import SwiftUI

struct MyListView: View {
    @State var createNew: Bool = false
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<Item>
    @Environment(\.managedObjectContext) var moc

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(moc.delete)
            
            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    var body: some View {   
        NavigationView{
            ZStack{
                Color("Background")
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color.blue)
                        Spacer()
                        
                        Menu{
                            Button(action: {
                                print("New Wishlist")
                            }, label: {
                                //Image(systemName: "plus")
                                Text("New Wishlist")
                            })
                            
                            Button(action: {
                                createNew = true
                            }, label: {
                                //Image(systemName: "plus")
                                Text("New Item")
                            })
                            
                        }label:{
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $createNew){
                            CreateListView()
                        }
                        
                    }
                    List{
                        ForEach(items) {item in
                            VStack{
                                //Takes you to the view that shows you more details
                                NavigationLink(destination: DetailView(itemName: item.name!, itemPrice: item.price!, itemPicture: item.picture ,itemLink: item.link ?? "", itemCurr: item.currency!, itemDesc: item.desc ?? "")){
                                    
                                    //Displays CardView
                                    CardView(itemName: item.name!, itemPrice: item.price!, itemPicture: item.picture ,itemLink: item.link ?? "", itemCurr: item.currency!, itemDesc: item.desc ?? "")
                                }
                            }
                            .listRowBackground(Color("DarkerBackground"))
                        }
                        .onDelete(perform: deleteItems)
                    }
                    .scrollContentBackground(.hidden)
                    .padding(10)
                    
                    Spacer()
                }
                .padding(30)
                .navigationBarTitle("Wishlists")
            }
        }
    }
}



struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
