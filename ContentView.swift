//
//  ContentView.swift
//  finalpro
//
//  Created by Piyussh Singhal on 4/20/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
    VStack {
                Image("asusquash")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                VStack(spacing: 80) {
                    NavigationLink(destination: RankModel()) {
                        Text("Rank of ASU")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: RosterModel()) {
                        Text("Team Roster")
                            .padding()
                            .background(Color.cyan)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink(destination: MapModel()) {
                        Text("Nearest Squash Court")
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                    }
                }
                .padding()
                
                Spacer()
            }
            .preferredColorScheme(.dark)
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
