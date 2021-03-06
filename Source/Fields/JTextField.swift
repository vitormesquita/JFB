//
//  JTextField.swift
//  JFB
//
//  Created by Vitor Mesquita on 16/04/2018.
//  Copyright © 2018 Jera. All rights reserved.
//

import Eureka

public struct JTextField: JField {
    
    public var id: String
    public var placeholder: String?
    public var validations: [ValidationType]
    
    let type: TextFieldType
    
    private var ruleSet: RuleSet<String> {
        return buildValidations(validations: validations)
    }
    
    public init(id: String, type: TextFieldType, placeholder: String? = nil, validations: [ValidationType] = []) {
        self.id = id
        self.type = type
        self.placeholder = placeholder
        self.validations = validations
    }
    
    public func build() -> BaseRow {
        return MaterialTextRow(id) { (row) in
            row.fieldType = type
            row.placeholder = placeholder
            row.add(ruleSet: ruleSet)
        }
    }
}
