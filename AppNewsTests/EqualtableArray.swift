//
//  EqualtableArray.swift
//  AppNewsTests
//
//  Created by Apple on 1/28/19.
//

struct EquatableArray<Element: Equatable> : Equatable {
    let elements: [Element]
    init(_ elements: [Element]) {
        self.elements = elements
    }
}

func == <E: Equatable>(lhs: EquatableArray<E>, rhs: EquatableArray<E>) -> Bool {
    return lhs.elements == rhs.elements
}
