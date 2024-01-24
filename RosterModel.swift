//
//  RosterModel.swift
//  finalpro
//
//  Created by Piyussh Singhal on 4/20/23.
//

import SwiftUI
import CoreData


struct RosterModel: View {
    // Fetch the managedObjectContext from the Environment
    @Environment(\.managedObjectContext) private var viewContext
    
    // Fetch the players from CoreData
    @FetchRequest(entity: Player.entity(), sortDescriptors: [])
    var players: FetchedResults<Player>
    
    // Initialize the EditMode state for the list
    @State var editMode: EditMode = .inactive
    
    var body: some View {
        NavigationView {
            List {
                ForEach(players, id: \.self) { player in
                    if editMode == .active {
                        // If the list is in edit mode, show the text field for editing
                        TextField("Player name", text: Binding(
                            get: { player.name ?? "" },
                            set: { newName in
                                player.name = newName
                                saveContext()
                            }
                        ))
                    } else {
                        // If the list is not in edit mode, show the player name
                        Text(player.name ?? "")
                    }
                }
                .onDelete(perform: deletePlayers)
            }
            .navigationTitle("Team Roster")
            .navigationBarItems(trailing: EditButton())
            // Activate/deactivate edit mode based on the state of the EditButton
            .environment(\.editMode, $editMode)
        }
    }
    
    // Function to delete players from CoreData
    private func deletePlayers(offsets: IndexSet) {
        withAnimation {
            offsets.map { players[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    // Function to save changes to CoreData
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
