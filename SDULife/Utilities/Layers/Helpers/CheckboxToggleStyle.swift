//
//  CheckboxToggleStyle.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 24.02.2022.
//

import Foundation
import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
  @Environment(\.isEnabled) var isEnabled
  let style: Style // custom param

  func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle() // toggle the state binding
    }, label: {
      HStack {
        Image(systemName: configuration.isOn ? "checkmark.\(style.sfSymbolName).fill" : style.sfSymbolName)
          .imageScale(.large)
        configuration.label
      }
    })
    .buttonStyle(PlainButtonStyle()) // remove any implicit styling from the button
    .disabled(!isEnabled)
  }

  enum Style {
    case square, circle

    var sfSymbolName: String {
      switch self {
      case .square:
        return "square"
      case .circle:
        return "circle"
      }
    }
  }
}

struct CheckboxField<Label: View>: View {
    @Binding var checked: Bool

    let label: Label
    let size: CGFloat
    let color: Color

    init(
        label: Label,
        size: CGFloat = 10,
        color: Color = Color.brandPrimary,
        checked: Binding<Bool>
    ) {
        self.label = label
        self.size = size
        self.color = color
        _checked = checked
    }

    var body: some View {
        Button(
            action: {
                self.checked.toggle()
            },
            label: {
                HStack(alignment: .center, spacing: 10) {
                    Image(
                        systemName: checked
                            ? "checkmark.square"
                            : "square"
                    )
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(color)
                    .frame(width: size, height: size)

                    label
                }
            }
        )
    }
}
