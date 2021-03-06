//
//  FormDataTableViewCell.swift
//  Forms-CoreData-Demo
//
//  Created by Pankaj Gaikar on 31/01/20.
//  Copyright © 2020 Pankaj Gaikar. All rights reserved.
//

import UIKit

protocol FormDataCellDelegate {
    func deleteForm(index:Int)
}

class FormDataTableViewCell: UITableViewCell {

    @IBOutlet weak var optionButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var viewCounterLabel: UILabel!
    @IBOutlet weak var rateContainerView: UIView!
    @IBOutlet weak var jobTermContainerView: UIView!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var jobTermLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    var delegate:FormDataCellDelegate?
    var cellIndex:Int = -1

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func optionButtonAction(_ sender: Any) {
        delegate?.deleteForm(index: cellIndex)
    }
}
