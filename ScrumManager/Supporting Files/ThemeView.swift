//
//  ThemeView.swift
//  ScrumManager
//
//  Created by Katie Saramutina on 27.02.2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
        }
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .bubblegum)
    }
}
