//
//  SettingsAccountCell.swift
//  BaseFoundationApp
//
//  Created by pablo borquez on 20/08/23.
//

import SwiftUI

struct SettingsAccountCell: View {
    var body: some View {
        NavigationLink {
            Text("Account")
        } label: {
            HStack {
                Image("penguin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 62, height: 62)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Pablo Bórquez")
                    Text("Apple ID, iCloud+, compras y más")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                }
            }
            .frame(height: 70)
        }
    }
}

struct SettingsAccountCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsAccountCell()
    }
}
