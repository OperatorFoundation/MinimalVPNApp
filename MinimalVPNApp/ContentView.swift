//
//  ContentView.swift
//  MinimalVPNApp
//
//  Created by Joshua Clark on 10/11/22.
//

import SwiftUI
import MinimalVPNLibrary

struct ContentView: View
{
    let vpn = VPNManager(serverIP: "127.0.0.1")

    var body: some View
    {
        Text("🫧 MinimalVPN 🫧")
        Button("Connect")
        {
            self.vpn.enable()
            do
            {
                try self.vpn.manager.connection.startVPNTunnel()
            }
            catch
            {
                print("Failed to start the tunnel: \(error)")
            }
        }
        
        Button("Disconnect")
        {
            self.vpn.manager.connection.stopVPNTunnel()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

