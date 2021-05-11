//
//  CalenderViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 23/04/2021.
//

import Foundation
import UIKit
import HorizonCalendar


class CalendarViewController: UIViewController{


      lazy var calendarView = CalendarView(initialContent: makeContent())
      lazy var calendar = Calendar.current
      lazy var dayDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = calendar.locale
        dateFormatter.dateFormat = DateFormatter.dateFormat(
          fromTemplate: "EEEE, MMM d, yyyy",
          options: 0,
          locale: calendar.locale ?? Locale.current)
        return dateFormatter
      }()
    
    var cal: calView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        cal = calView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        view.addSubview(cal)
        overrideUserInterfaceStyle = .light
        
        let calendarView = CalendarView(initialContent: makeContent())
        
        view.addSubview(calendarView)
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.backgroundColor = .white

        NSLayoutConstraint.activate([
          calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
          calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
            calendarView.topAnchor.constraint(equalTo: cal.Title.bottomAnchor, constant: 15),
            calendarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -85),
        ])
        
        calendarView.daySelectionHandler = { [weak self] day in
              guard let self = self else { return }

              switch self.calendarSelection {
              case .singleDay(let selectedDay):
                if day > selectedDay {
                  self.calendarSelection = .dayRange(selectedDay...day)
                } else {
                  self.calendarSelection = .singleDay(day)
                }
              case .none, .dayRange:
                self.calendarSelection = .singleDay(day)
              }

              calendarView.setContent(self.makeContent())
            
            }
        
    }
    
    @objc func backPressed(sender: UIButton!){
        self.dismiss(animated: true, completion: nil)
    }
    
    private func makeContent() -> CalendarViewContent {
      let calendar = Calendar.current
        
           let startDate = Date()
           let endDate = calendar.date(from: DateComponents(year: 2050, month: 12, day: 31))!

           let calendarSelection = self.calendarSelection
           let dateRanges: Set<ClosedRange<Date>>
           if
             case .dayRange(let dayRange) = calendarSelection,
             let lowerBound = calendar.date(from: dayRange.lowerBound.components),
             let upperBound = calendar.date(from: dayRange.upperBound.components)
           {
             dateRanges = [lowerBound...upperBound]
           } else {
             dateRanges = []
           }
        
        return CalendarViewContent(
              calendar: calendar,
              visibleDateRange: startDate...endDate,
              monthsLayout: .vertical(options: VerticalMonthsLayoutOptions()))

              .withInterMonthSpacing(24)
              .withVerticalDayMargin(8)
              .withHorizontalDayMargin(8)

              .withDayItemModelProvider { [weak self] day in
                let textColor: UIColor
                    textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
            
                let isSelectedStyle: Bool
                switch calendarSelection {
                case .singleDay(let selectedDay):
                  isSelectedStyle = day == selectedDay
                case .dayRange(let selectedDayRange):
                  isSelectedStyle = day == selectedDayRange.lowerBound || day == selectedDayRange.upperBound
                case .none:
                  isSelectedStyle = false
                }

                let dayAccessibilityText: String?
                if let date = self?.calendar.date(from: day.components) {
                  dayAccessibilityText = self?.dayDateFormatter.string(from: date)
                } else {
                  dayAccessibilityText = nil
                }

                return CalendarItemModel<DayView>(
                    invariantViewProperties: .init(textColor: textColor, isSelectedStyle: isSelectedStyle),
                  viewModel: .init(dayText: "\(day.day)", dayAccessibilityText: dayAccessibilityText))
              }
            
            .withMonthHeaderItemModelProvider { [weak self] month in
                    let textColor: UIColor
                    
                     textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
                   

                    return CalendarItemModel<MonthLabel>(
                        invariantViewProperties: .init(font: UIFont(name: "GTEestiDisplay-Medium", size: 26)!,
                                                       textColor: textColor,
                                                       backgroundColor: .clear),
                      viewModel: .init(month: month))
                 }
            

              .withDayRangeItemModelProvider(for: dateRanges) { dayRangeLayoutContext in
                CalendarItemModel<DayRangeIndicatorView>(
                  invariantViewProperties: .init(),
                  viewModel: .init(
                    framesOfDaysToHighlight: dayRangeLayoutContext.daysAndFrames.map { $0.frame }))
    }

}
    
    private enum CalendarSelection {
        case singleDay(Day)
        case dayRange(DayRange)
      }
      private var calendarSelection: CalendarSelection?
    
}
