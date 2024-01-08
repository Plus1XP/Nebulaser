//
//  ButtonStyle.swift
//  Nebulaser
//
//  Created by nabbit on 08/01/2024.
//

import SwiftUI

public struct ButtonWithoutAnimation: ButtonStyle {
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}
