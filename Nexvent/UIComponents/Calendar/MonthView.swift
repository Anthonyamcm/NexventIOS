//
//  MonthView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 01/05/2021.
//

import Foundation
import HorizonCalendar
import UIKit



struct MonthLabel: CalendarItemViewRepresentable {

  /// Properties that are set once when we initialize the view.
  struct InvariantViewProperties: Hashable {
    let font: UIFont
    var textColor: UIColor
    var backgroundColor: UIColor
  }

  /// Properties that will vary depending on the particular date being displayed.
  struct ViewModel: Equatable {
    let month: Month
  }

  static func makeView(withInvariantViewProperties invariantViewProperties: InvariantViewProperties) -> UILabel {
    let label = UILabel()

    label.backgroundColor = invariantViewProperties.backgroundColor
    label.font = invariantViewProperties.font
    label.textColor = invariantViewProperties.textColor
    label.textAlignment = .left
    
    return label
  }

  static func setViewModel(_ viewModel: ViewModel, on view: UILabel) {
    view.text = "\(viewModel.month)"
  }

}
