//
//  ViewSettings.swift
//  MediumEnvironmentObject
//
//  Created by Tatenda Kabike on 24/7/2021.
//

import Foundation
import SwiftUI

struct ViewSettings: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
    
        Text("\(settings.userRole == 0 ? "User" : "Admin") is \(settings.setting == 0 ? "Active" : "Inactive" )")
    }
}
