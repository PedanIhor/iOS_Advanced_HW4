//
//  SegmentedControl.swift
//  Diagrams
//
//  Created by Ihor Pedan on 24.12.2019.
//  Copyright © 2019 Ihor Pedan. All rights reserved.
//

import SwiftUI
import UIKit

struct SegmentedControl: UIViewRepresentable {
  @Binding var selectedScope: Int
  
  func makeUIView(context: UIViewRepresentableContext<SegmentedControl>) -> UISegmentedControl {
    let view = UISegmentedControl(items: ["Pie", "Bar", "Line"])
    let coordinator: Coordinator = context.coordinator
    view.addTarget(coordinator, action: #selector(coordinator.action(_:)), for: .valueChanged)
    view.selectedSegmentIndex = selectedScope
    return view
  }
  
  func updateUIView(_ uiView: UISegmentedControl, context: UIViewRepresentableContext<SegmentedControl>) {
    uiView.selectedSegmentIndex = selectedScope
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(selectedScope: $selectedScope)
  }
  
  class Coordinator: NSObject {
    var selectedScope: Binding<Int>
    init(selectedScope: Binding<Int>) {
      self.selectedScope = selectedScope
      super.init()
    }
    
    @objc func action(_ sender: UISegmentedControl) {
      selectedScope.wrappedValue = sender.selectedSegmentIndex
    }
  }
}
