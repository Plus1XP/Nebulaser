//
//  ContentView.swift
//  Nebulaser
//
//  Created by nabbit on 08/01/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var isClicked = false
    @State var longPressDetected = false
    @State var tapCount: CGFloat = 0.0
    @State var startDate: Date = Date()
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        Button(action: {
            if self.longPressDetected {
                debugPrint("Long Press Stopped")
                self.tapCount = 0.0
                self.isClicked = false
                self.longPressDetected = false
            } else {
                debugPrint("Short Press")
            }
        }) {
            ZStack {
                TimelineView(.animation) { context in
                    Rectangle()
                        .foregroundStyle(.white)
                        .timeLines(seconds: context.date.timeIntervalSince1970 - self.startDate.timeIntervalSince1970,
                                   tapValue: self.tapCount
                        )
                        .ignoresSafeArea()
                }
                .onTapGesture(perform: {
                    debugPrint("Tap Detected")
                    self.isClicked  = false
                    self.longPressDetected = false
                    self.tapCount = 0.0
                })
            }
        }
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.2).onEnded({ _ in
                debugPrint("Long Press Triggered")
                    self.isClicked = true
                    self.longPressDetected = true
            })
        )
        .onReceive(self.timer, perform: { _ in
            if self.isClicked {
                self.tapCount += 0.1
            }
        })
        .buttonStyle(ButtonWithoutAnimation())
    }
}

#Preview {
    ContentView()
}
