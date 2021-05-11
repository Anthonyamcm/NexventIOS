//
//  DayView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 01/05/2021.
//

import Foundation
import HorizonCalendar
import UIKit



// MARK: - DayView
final class DayView: UIView {

  // MARK: Lifecycle
  init(invariantViewProperties: InvariantViewProperties) {
    dayLabel = UILabel()
    dayLabel.font = invariantViewProperties.font
    dayLabel.textAlignment = invariantViewProperties.textAlignment
    dayLabel.textColor = invariantViewProperties.textColor

    super.init(frame: .zero)

    addSubview(dayLabel)

    layer.borderColor = invariantViewProperties.selectedColor.cgColor
    layer.borderWidth = invariantViewProperties.isSelectedStyle ? 2 : 0
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal
  var dayText: String {
    get { dayLabel.text ?? "" }
    set { dayLabel.text = newValue }
  }

  var dayAccessibilityText: String?

  var isHighlighted = false {
    didSet {
      updateHighlightIndicator()
    }
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    dayLabel.frame = bounds
    layer.cornerRadius = min(bounds.width, bounds.height) / 2
  }

  // MARK: Private
  private let dayLabel: UILabel

  private func updateHighlightIndicator() {
    backgroundColor = isHighlighted ? UIColor.black.withAlphaComponent(0.1) : .clear
  }

}

// MARK: UIAccessibility
extension DayView {

  override var isAccessibilityElement: Bool {
    get { true }
    set { }
  }

  override var accessibilityLabel: String? {
    get { dayAccessibilityText ?? dayText }
    set { }
  }

}

// MARK: CalendarItemViewRepresentable
extension DayView: CalendarItemViewRepresentable {

  struct InvariantViewProperties: Hashable {
    var font = UIFont(name: "GTEestiDisplay-Medium", size: 18)!
    var textAlignment = NSTextAlignment.center
    var textColor: UIColor
    var isSelectedStyle: Bool
    var selectedColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
  }

  struct ViewModel: Equatable {
    let dayText: String
    let dayAccessibilityText: String?
  }

  static func makeView(
    withInvariantViewProperties invariantViewProperties: InvariantViewProperties)
    -> DayView
  {
    DayView(invariantViewProperties: invariantViewProperties)
  }

  static func setViewModel(_ viewModel: ViewModel, on view: DayView) {
    view.dayText = viewModel.dayText
    view.dayAccessibilityText = viewModel.dayAccessibilityText
  }

}
