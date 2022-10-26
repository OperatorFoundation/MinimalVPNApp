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
    let vpn = VPNManager(serverIP: "")

    var body: some View
    {
        VStack()
        {
            Text("🫧 MinimalVPN 🫧")
            
            Button("Connect")
            {
                print("MinimalVPNAPP: 👆 Connect button tapped.")
                
                if (!self.vpn.manager.isEnabled)
                {
                    print("MinimalVPNAPP: calling enable()")
                    self.vpn.enable()
                }
                
                do
                {
                    print("MinimalVPNAPP: calling startVPNTunnel")
                    try self.vpn.manager.connection.startVPNTunnel()
                }
                catch
                {
                    print("MinimalVPNApp: Failed to start the tunnel: \(error)")
                }
            }
            
            Button("Disconnect")
            {
                print("MinimalVPNAPP: 👆 Connect button tapped.")
                
                self.vpn.manager.connection.stopVPNTunnel()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

