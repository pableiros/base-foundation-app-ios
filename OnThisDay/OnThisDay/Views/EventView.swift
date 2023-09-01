//
//  EventView.swift
//  OnThisDay
//
//  Created by pablo borquez on 23/08/23.
//

import SwiftUI

struct EventView: View {
    var event: Event
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 30) {
                Text(self.event.year)
                    .font(.title)
                
                Text(self.event.text)
                    .font(.title3)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Related Links:")
                        .font(.title2)
                    
                    ForEach(self.event.links) { eventLink in
                        Link(eventLink.title, destination: eventLink.url)
                            .onHover { isInside in
                                if isInside {
                                    NSCursor.pointingHand.push()
                                } else {
                                    NSCursor.pop()
                                }
                            }
                    }
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
        .frame(width: 250)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView(event: Event.sampleEvent)
    }
}
