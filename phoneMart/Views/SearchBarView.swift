//
//  SearchBarView.swift
//  TasteLifeTVApp
//
//  Created by YEN-JU HUANG on 2022/7/11.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    @Binding var startSearch: Bool
    @Binding var endSearch: Bool
    
    // environment object for offset
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color.black.opacity(0.5))
            
            TextField("Search", text: $searchText, onCommit: {
                print("start searching!")
                vm.search()
                if startSearch == false {
                    startSearch.toggle()
                }
            })
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.gray.opacity(0.7))
                        .opacity(searchText.isEmpty ? 0.0 : 1.0).onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                            print("end search!")
                            vm.endSearch()
                            if endSearch == false {
                                endSearch.toggle()
                            }
                        },
                    alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
        )
        .padding()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), startSearch: .constant(false), endSearch: .constant(false))
            .previewLayout(.sizeThatFits)
    }
}
