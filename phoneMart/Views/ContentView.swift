//
//  ContentView.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @StateObject private var vm: ViewModel
    
    // a flag that indicates searching api was executed after user pressed "return" on keyboard
    @State private var startSearch = false
    @State private var endSearch = false
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0, green: 144/255, blue: 213/255, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        _vm = StateObject(wrappedValue: ViewModel())
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    SearchBarView(searchText: $vm.searchText, startSearch: $startSearch, endSearch: $endSearch)
                       
                    List(vm.items) { phoneItem in
                        ZStack {
                            NavigationLink(destination: PhoneItemDetail(item: phoneItem)) {
                                EmptyView()
                            }
                            .opacity(0)
                            
                            HStack {
                                WebImage(url: .init(string: phoneItem.imageUrl))
                                    .resizable()
                                    .scaledToFit()
                                
                                VStack(alignment: .leading) {
                                    Text(phoneItem.martName)
                                        .padding()
                                    Text("$\(phoneItem.finalPrice)")
                                        .foregroundColor(Color.red)
                                        .fontWeight(.bold)
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                        } label: {
                                            Image(systemName: "suit.heart")
                                                .imageScale(.medium)
                                                .foregroundColor(Color.gray.opacity(0.7))
                                        }
                                        
                                        Button {
                                        } label: {
                                            Image(systemName: "cart")
                                                .imageScale(.medium)
                                                .foregroundColor(Color.gray.opacity(0.7))
                                        }
                                    }
                                    .padding(.top, 8.0)
                                    .padding(.leading, 8.0)
                                    .padding(.bottom, 8.0)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
            }
            .background(Color.init(uiColor: UIColor(red: 0, green: 144/255, blue: 213/255, alpha: 1.0)))
            
        }
        .environmentObject(vm)
        .onAppear {
            UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
