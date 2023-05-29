//  LevelModel.swift
//  meditar
//  Created by Losark on 27/5/23.

import Foundation
import SwiftUI


//TODO: Hacer que segun el nivel escogido devuelva una serie de variables

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
    case lama
    
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
        case .lama:
            return "Lama"
        }
    }
}
