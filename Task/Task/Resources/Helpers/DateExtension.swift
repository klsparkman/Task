//
//  DateExtension.swift
//  Task
//
//  Created by Kelsey Sparkman on 3/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation

extension Date {
    func dateToString () -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM, yyyy"
        return dateFormatter.string(from: self)
    }
}
