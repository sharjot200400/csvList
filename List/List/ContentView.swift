//
//  ContentView.swift
//  List
//
//  Created by user216710 on 4/14/22.
//

import SwiftUI

struct ContentView: View {
    var content = loadCSV(from: "demo")
    var body: some View {
        List(content) {content in
            Text(content.Country + " " + content.code)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
