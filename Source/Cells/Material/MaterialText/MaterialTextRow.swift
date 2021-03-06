//
//  MaterialTextRow.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import UIKit
import Eureka

final class MaterialTextRow: MaterialBaseRow<MaterialTextFieldCell>, RowType {
    
    var fieldType: TextFieldType = .text
    
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<MaterialTextFieldCell>()
    }
    
    /// Formatted text just for fields that have any kind of mask
    override var formattedText: String? {
        return fieldType.applyMask(value)
    }
    
    /// To update value if doesn't have mask
    func setValue(text: String?) {
        if let text = text, !text.isEmpty {
            value = text
        } else {
            value = nil
        }
    }
    
    /// To update text if has mask
    func updateText(text: String, range: NSRange) {
        if range.length == value?.count {
            clearText()
            return
        }
        
        var allText = value ?? ""
        
        if !text.isEmpty {
            allText += text
        }
        
        if text.isEmpty && !allText.isEmpty {
            allText.removeLast()
            
            let removedLastText = allText
            allText = ""
            
            for character in removedLastText {
                allText += String(character)
            }
        }
        
        if allText.count <= fieldType.max {
            value = allText.isEmpty ? nil : allText
            cell.update()
        }
    }
}
