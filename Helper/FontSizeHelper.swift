//
//  Font.swift
//  exerciselibrary
//
//  Created by Wilson Chan on 1/21/24.
//

import Foundation
import SwiftUI

extension Font {
    static var onboardNumber = Font.system(size: 128, weight: .bold)
    static var testFontNumber = Font.custom("ChakraPetch-Regular", size: 128)
    static var testFontTitle = Font.custom("ChakraPetch-Regular", size: 18)
    static var testFontList = Font.custom("ChakraPetch-Regular", size: 18)
    static var onboardTitle = Font.system(size: 18)
    static var onboardList = Font.system(size: 18)
    static var screenHeading = Font.system(size: 36, weight: .bold)
    static var bigHeadline = Font.system(size: 24, weight: .bold)
    static var smallHeadline = Font.system(size: 18, weight: .bold)
    static var featuredNumber = Font.system(size: 18)
    static var featuredText = Font.system(size: 12)
    static var regularText = Font.system(size: 10)
    static var captionText = Font.system(size: 8)
}
