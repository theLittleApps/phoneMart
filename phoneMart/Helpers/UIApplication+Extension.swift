//
//  UIApplication+Extension.swift
//  TasteLifeTVApp
//
//  Created by YEN-JU HUANG on 2022/7/11.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
