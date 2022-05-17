//
//  ContentDelegate.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 08.03.2021.
//

protocol ContentDelegate: class {
    func itemSelected(id: String)
}

extension ContentDelegate {
    func itemSelected(id: String) {}
}
