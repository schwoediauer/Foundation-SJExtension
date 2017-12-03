//
//  DateTools.swift
//  SJExtension
//
//  Created by Juergen Schwoediauer on 12.11.17.
//  Copyright © 2017 Juergen Schwoediauer. All rights reserved.
//

import Foundation

public class DateTool {
    
    public init() {
    
    }
    
    /****************************************************************************************
    * public func checkAdventWeek
    * <Input>   Date()
    * <Return>  Int... 1,2,3,4,0 for advent week - 0 for Date is out of advent Range or error
    *
    *
    *****************************************************************************************/
     public func checkAdventWeek(checkDate: Date) -> Int {
        
        let cal = Calendar.current
        /*only for copy template =============================
         cal.component(.year, from: checkDate)
         cal.component(.month, from: checkDate)
         cal.component(.day, from: checkDate)
         cal.component(.weekday, from: checkDate) */
        
        //check actual year and set christmas for this -----------------
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var tempstring = String(cal.component(.year, from: checkDate))
        tempstring += "/12/24"          //makes "2017/12/24" e.g.
        let christmas = formatter.date(from: tempstring)
        
        if cal.component(.month, from: checkDate) == 12 && cal.component(.day, from: checkDate) <= 24 {
            
            var weekdayTemp = cal.component(.weekday, from: christmas!)
            var lastAdventSunday = 24
            
            while weekdayTemp > 1 {
                weekdayTemp -= 1
                lastAdventSunday -= 1
            }
            
            switch cal.component(.day, from: checkDate) {
            case lastAdventSunday...24:
                return 4                        // 4th advent week
            case lastAdventSunday-7...lastAdventSunday:
                return 3                        // 3th advent week
            case lastAdventSunday-14...lastAdventSunday:
                return 2                        // 2nd advent week
            case lastAdventSunday-21...lastAdventSunday:
                return 1                        // 1st advent week
            default:
                return 0                        // out of advant range
            }
            
        }
        return 0                                // in case of errors
    }
    
    /****************************************************************************************
    * public func CheckDayTime
    * <Input>   Date()
    * <Return>  String for current day time e.g. morning, night...
    *
    *
    *****************************************************************************************/
    public func CheckDayTime(checkDate: Date) -> String {
        
        let cal = Calendar.current
        let hour = cal.component(.hour, from: checkDate)
        let temp = Int(hour)
        
        switch temp {
        case 0..<3:
            return "Nacht"
        case 3..<5:
            return "Früh"
        case 5..<9:
            return "Morgen"
        case 9..<11:
            return "Vormittag"
        case 11..<13:
            return "Mittag"
        case 13..<19:
            return "Nachmittag"
        case 19..<23:
            return "Abend"
        case 23..<24:
            return "Nacht"
        default:
            return ""
        }
        
    }
    
    
    //some Tests =======================================================
    public func testFunc() {
            print("testFunc")
    }
    
    public class func testClassMethod() {
        print("testClassMethod")
    }
    
    
}
