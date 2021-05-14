//
//  ProfileViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 20/04/2021.
//

import UIKit
import HorizonCalendar
import TTGTagCollectionView


class DashboardViewController: UIViewController,TTGTextTagCollectionViewDelegate{
    
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
    
    let strings = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
                           "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
                           "on", "constraints", "placed", "on", "those", "views"]

    var DashBoard: DashBoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DashBoard = DashBoardView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        view.addSubview(DashBoard)
        
        setUpChart()
        setUpCalender()
        setUpTagView()
        
        let locationTap = UITapGestureRecognizer(target: self, action: #selector(self.LocationPressed(_:)))
        DashBoard.LocationView.addGestureRecognizer(locationTap)
        DashBoard.LocationView.isUserInteractionEnabled = true
        
        
    }
    

    
    func setUpCalender() {
        let calendarView = CalendarView(initialContent: makeContent())
        
        view.addSubview(calendarView)
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.backgroundColor = .white

        NSLayoutConstraint.activate([
          calendarView.leadingAnchor.constraint(equalTo: DashBoard.CalendarView.leadingAnchor, constant: 5),
          calendarView.trailingAnchor.constraint(equalTo: DashBoard.CalendarView.trailingAnchor,constant: 0),
          calendarView.topAnchor.constraint(equalTo: DashBoard.CalendarTitle.bottomAnchor, constant: 10),
          calendarView.bottomAnchor.constraint(equalTo: DashBoard.CalendarView.bottomAnchor, constant: -10),
        ])
        
        let calendarTap = UITapGestureRecognizer(target: self, action: #selector(self.CalendarPressed(_:)))
        calendarView.addGestureRecognizer(calendarTap)
        calendarView.isUserInteractionEnabled = true
    
    }
    
    
    private func makeContent() -> CalendarViewContent {
           let calendar = Calendar.current
           let startDate = Date()
           let endDate = Date()

        
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

                let dayAccessibilityText: String?
                if let date = self?.calendar.date(from: day.components) {
                  dayAccessibilityText = self?.dayDateFormatter.string(from: date)
                } else {
                  dayAccessibilityText = nil
                }

                return CalendarItemModel<DayViewDashBoard>(
                    invariantViewProperties: .init(textColor: textColor),
                  viewModel: .init(dayText: "\(day.day)", dayAccessibilityText: dayAccessibilityText))
              }
            
            .withMonthHeaderItemModelProvider { [weak self] month in
                    let textColor: UIColor
                    
                     textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
                   

                    return CalendarItemModel<MonthLabel>(
                        invariantViewProperties: .init(font: UIFont(name: "GTEestiDisplay-Medium", size: 18)!,
                                                       textColor: textColor,
                                                       backgroundColor: .clear),
                      viewModel: .init(month: month))
                 }
            

        }
    
    func setUpTagView(){
        
        DashBoard.collectionView.delegate = self
        DashBoard.collectionView.alignment = .left
        DashBoard.collectionView.enableTagSelection = false
        DashBoard.collectionView.showsVerticalScrollIndicator = false
        
        for text in strings {
                    let content = TTGTextTagStringContent.init(text: text)
                    content.textColor = UIColor.white
                    content.textFont = UIFont(name: "GTEestiDisplay-Medium", size: 16)!
                    
                    let normalStyle = TTGTextTagStyle.init()
                    normalStyle.borderWidth = .zero
                    normalStyle.enableGradientBackground = true
                    normalStyle.gradientBackgroundStartColor = UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1)
                    normalStyle.gradientBackgroundStartPoint = CGPoint(x: 0, y: 0)
                    normalStyle.gradientBackgroundEndColor = UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1)
                    normalStyle.gradientBackgroundEndPoint = CGPoint(x: 1, y: 1)
                    normalStyle.shadowColor = UIColor.systemBlue
                    normalStyle.extraSpace = CGSize.init(width: 10, height: 5)
                    
                    
                    let tag = TTGTextTag.init()
                    tag.content = content
                    tag.style = normalStyle

                    
            DashBoard.collectionView.addTag(tag)
                }
        
        DashBoard.collectionView.reload()
        
        let tagsTap = UITapGestureRecognizer(target: self, action: #selector(self.TagsPressed(_:)))
        DashBoard.collectionView.addGestureRecognizer(tagsTap)
        DashBoard.collectionView.isUserInteractionEnabled = true
    }
    
    func setUpChart() {
        let chart = BarGraph(frame: CGRect(x: 0, y: 0, width: screenSize().width - 30, height: 200))
        let dataEntries = [
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.2, textValue: "20", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.7, textValue: "70", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.3, textValue: "20", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.55, textValue: "55", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.66, textValue: "66", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.7, textValue: "90", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.23, textValue: "23", title:
                "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.45, textValue: "45", title: "Test")
        ]
        chart.updateDataEntries(dataEntries: dataEntries, animated: true)
        DashBoard.ChartView.addSubview(chart)
    }
    
    @objc func CalendarPressed(_ sender: UITapGestureRecognizer) {
        let Controller = CalendarViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true, completion: nil)
    }
    
    @objc func TagsPressed(_ sender: UITapGestureRecognizer) {
        let Controller = TagsViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true, completion: nil)
    }
    
    @objc func LocationPressed(_ sender: UITapGestureRecognizer) {
        let Controller = MapViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true, completion: nil)
    }

}
