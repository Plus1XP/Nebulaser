//
//  View.swift
//  Nebulaser
//
//  Created by nabbit on 08/01/2024.
//

import SwiftUI

extension View {
    func timeLines(seconds: Double,  tapValue: CGFloat ) -> some View {
        self
            .colorEffect(
                ShaderLibrary.default.timeLines(
                    .boundingRect,
                    .float(seconds),
                    .float(tapValue))
            )
    }
}
