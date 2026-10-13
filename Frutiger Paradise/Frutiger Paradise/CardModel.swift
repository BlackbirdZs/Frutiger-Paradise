//
//  CardModel.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 13.10.2026.
//

import Foundation

struct ParadiseCard {
    let descriprion: String
    let image: String
}

extension ParadiseCard {
    static func make() -> [ParadiseCard] { [
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
        ParadiseCard(descriprion: "Some decription", image: "pic20"),
    ] }
}
