//
//  ContentView.swift
//  MediumEnvironmentObject
//
//  Created by Tatenda Kabike on 24/7/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var settings = UserSettings()
    
    @State private var settingsTag = 0
    @State private var roleSettingsTag = 0
    
    @State private var active = "InActive"
    @State private var userRole = "User"
    @State private var selection = 2
    @State private var roleSelection = 1
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemPink
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.systemPink], for: .normal)
    }
    var body: some View {
     
        NavigationView {
            
          
            VStack {
            
                Picker("", selection: $settingsTag){
                    Text("Active").tag(0)
                    Text("InActive").tag(1)
                    
                }.onChange(of: settingsTag){_ in
                    
                    settings.setting = settingsTag
                }
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                Text("\(settingsTag)")
               
                Divider()
                    .frame(height: 1)
               
                Picker("", selection: $roleSettingsTag){
                    Text("User").tag(0)
                    Text("Admin").tag(1)
                    
                }
                .onChange(of: roleSettingsTag){_ in
                  
                    settings.userRole = roleSettingsTag
                }
                .padding()
                .pickerStyle(SegmentedPickerStyle())
                
                Text("\(roleSettingsTag)")
                    
                
                Button(action: {
                    print(settings.setting)
                    print(settings.userRole)
                    
                   
                
                }) {
                    
                    NavigationLink(destination: ViewSettings()) {
                        
                
                    Text("View Settings")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.pink)
                        .cornerRadius(5)
                        .padding(.top, 30)
                        
                    }
                    
                }
            }
        
        }.environmentObject(settings)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
