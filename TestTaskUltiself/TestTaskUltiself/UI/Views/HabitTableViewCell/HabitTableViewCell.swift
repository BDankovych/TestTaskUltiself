//
//  HabitTableViewCell.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cellNumberLabel: UILabel!
    @IBOutlet private weak var habitTitleLabel: UILabel!
    @IBOutlet private weak var habitIdLabel: UILabel!
    
    override func prepareForReuse() {
        cellNumberLabel.text = ""
        habitTitleLabel.text = ""
        habitIdLabel.text = ""
    }
    
    func configure(cellNumber: Int, habit: HabitModelDTO) {
        cellNumberLabel.text = String(cellNumber)
        habitTitleLabel.text = habit.title
        habitIdLabel.text = String(habit.id)
    }
}
