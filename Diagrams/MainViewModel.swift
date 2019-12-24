//
//  MainViewModel.swift
//  Diagrams
//
//  Created by Ihor Pedan on 24.12.2019.
//  Copyright © 2019 Ihor Pedan. All rights reserved.
//

import Foundation
import Combine

final class MainViewModel: ObservableObject {
  @Published var selectedScope: Int = 0
}
