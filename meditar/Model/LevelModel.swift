//  LevelModel.swift
//  meditar
//  Created by Losark on 27/5/23.

import Foundation
import SwiftUI

struct LevelModel {
    var id: Int
    var level: Levels
    var color: Color
    var tiempo: Int
}

enum Levels {
    case principiante
    case intermedio
    case experto
    case maestro
    
    var levelString: String {
        switch self {
        case .principiante:
            return "Principiante"
        case .intermedio:
            return "Intermedio"
        case .experto:
            return "Experto"
        case .maestro:
            return "Maestro"
        }
    }
}
