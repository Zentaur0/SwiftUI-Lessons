//
//  New.swift
//  SwiftUI lessons
//
//  Created by Антон Сивцов on 16.12.2021.
//

import Foundation

// MARK: - Style
enum StringStyle {
    case kebab
    case camel
    case snake
}

class StyledText {
    
    @CodingStyle(style: .snake) private static var snakeStyle = ""
    @CodingStyle(style: .kebab) private static var kebabStyle = ""
    @CodingStyle(style: .camel) private static var camelStyle = ""
    
    static func setStyle(for text: String, style: StringStyle) -> String {
        switch style {
        case .kebab:
            return Self.getKebabText(text)
        case .snake:
            return Self.getSnakeText(text)
        case .camel:
            return Self.getCamelText(text)
        }
    }
    
    private static func getKebabText(_ text: String) -> String {
        kebabStyle = text
        return kebabStyle
    }
    
    private static func getSnakeText(_ text: String) -> String {
        snakeStyle = text
        return snakeStyle
    }
    
    private static func getCamelText(_ text: String) -> String {
        camelStyle = text
        return camelStyle
    }
}

@propertyWrapper
struct CodingStyle {
    // MARK: - Private Properties
    private var value: String
    private let style: StringStyle
    
    // MARK: - Init
    init(wrappedValue: String, style: StringStyle) {
        self.value = wrappedValue
        self.style = style
    }
    
    var wrappedValue: String {
        get {
            return value
        }
        set {
            makeStyledString(newValue)
        }
    }
    
    // MARK: - Methods
    private mutating func makeStyledString(_ oldValue: String) {
        switch style {
        case .kebab:
            makeKebabString(oldValue)
        case .camel:
            makeCamelString(oldValue)
        case .snake:
            makeSnakeString(oldValue)
        }
    }
    
    private mutating func makeKebabString(_ oldValue: String) {
        value = applyKebabOrSnake(oldValue, "-")
    }
    
    private mutating func makeSnakeString(_ oldValue: String) {
        value = applyKebabOrSnake(oldValue, "_")
    }
    
    private mutating func makeCamelString(_ oldValue: String) {
        value = applyCamel(oldValue)
    }
    
    private func applyCamel(_ oldValue: String) -> String {
        let oldValue = oldValue.lowercased()
        var newValue = Array(oldValue.lowercased())
        var isNewValueChanged = false
        
        oldValue
            .enumerated()
            .forEach { index, element in
                if !isNewValueChanged {
                    if element == " " {
                        let prefix = newValue.prefix(upTo: index)
                        newValue.removeAll()
                        newValue.append(contentsOf: prefix)
                        isNewValueChanged = true
                    }
                }
                
                if element == " " {
                    let oldValueArray = Array(oldValue)
                    var slise = oldValueArray.suffix(from: index)
                    slise.removeFirst()
                    let firstLetter = slise.first?.uppercased()
                    if let firstLetter = firstLetter {
                        newValue.append(contentsOf: firstLetter)
                        slise.removeFirst()
                        let prefix = slise.prefix() { $0 != " "}
                        newValue.append(contentsOf: prefix)
                    }
                }
            }
        
        return String(newValue)
    }
    
    private func applyKebabOrSnake(_ oldValue: String, _ changingValue: String) -> String {
        var newValue = Array(oldValue.lowercased())
        let changingValue = changingValue
        
        newValue
            .enumerated()
            .forEach { index, element in
            if element == " " {
                newValue.remove(at: index)
                newValue.insert(contentsOf: changingValue, at: index)
            }
        }
        return String(newValue)
    }
}
