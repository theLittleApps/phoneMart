//
//  ViewModel.swift
//  phoneMart
//
//  Created by YEN-JU HUANG on 2022/9/20.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    let phoneMartWebSer = PhoneMartWebService()
    var cancellables = Set<AnyCancellable>()
    
    @Published var items: [PhoneItem] = []
    @Published var searchText: String = ""
    
    private var saveItems: [PhoneItem] = []
    
    init() {
        if let _ = UserDefaults.standard.data(forKey: "PhoneItems") {
            print("load phone items from local")
            load()
        }else {
            print("fetch phone items from web")
            fetchPhoneItems()
        }
    }
    
    private func fetchPhoneItems() {
        phoneMartWebSer.fetchPhoneItemList()
            .sink {complition in
                switch complition {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching phone item list. \(error)")
                }
            } receiveValue: { [weak self] listData in
                guard let self = self else {
                    return
                }
                self.saveItems = listData.data
                self.save()
            }
            .store(in: &cancellables)
    }
    
    private func save() {
        if saveItems.count != 0 {
            do {
                let encoder = JSONEncoder()
                
                // encode phone items
                let data = try encoder.encode(saveItems)
                
                // write data to user defaults
                UserDefaults.standard.set(data, forKey: "PhoneItems")
                
                // then load again
                load()
                
            }catch {
                print("Unable to Encode Array of PhoneItem (\(error))")
            }
        }
    }
    
    private func load() {
        // read data from user defaults
        if let data = UserDefaults.standard.data(forKey: "PhoneItems") {
            do {
                let decoder = JSONDecoder()
                
                items = try decoder.decode([PhoneItem].self, from: data)
                
            }catch {
                print("Unable to Decode Array of PhoneItem (\(error))")
            }
        }
    }
    
    // MARK: - Public APIs
    func search() {
        if searchText.isEmpty {
            endSearch()
        }else {
            items = items.filter{ $0.martName.contains(searchText)}
        }
    }
    
    func endSearch() {
        load()
    }
}
