//
//  Assembler.swift
//  iHolidays
//
//  Created by Saúl Moreno Abril on 25/1/21.
//

import Swinject

extension Assembler {
    static let shared: Assembler = {
        let container = Container()
        let assembler = Assembler([
            CommonAssembly(),
            ServicesAssembly(),
            RepositoriesAssembly(),
            UseCasesAssembly()
        ], container: container)
        return assembler
    }()
}
