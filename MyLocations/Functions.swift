//
//  Functions.swift
//  MyLocations
//
//  Created by Student on 2019-03-11.
//  Copyright © 2019 Liam Quinn. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: run)
}
