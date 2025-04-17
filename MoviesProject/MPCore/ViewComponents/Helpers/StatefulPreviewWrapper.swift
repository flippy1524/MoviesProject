//
//  StatefulPreviewWrapper.swift
//  MoviesProject
//
//  Created by Ivan Velkov on 14.4.25.
//


import SwiftUI
//NOTE: Used to be able to run previews with bindable values, just replace the value with the expected binding parameter and insert the view inside the wrapper

struct StatefulPreviewWrapper<Value: Any, Content: View>: View {
    @State private var value: Value
    private var content: (Binding<Value>) -> Content

    init(_ value: Value, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self._value = State(initialValue: value)
        self.content = content
    }

    var body: some View {
        content($value)
    }
}