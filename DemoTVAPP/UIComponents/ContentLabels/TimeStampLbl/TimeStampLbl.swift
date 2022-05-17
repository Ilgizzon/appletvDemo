//
//  TimeStampLbl.swift
//  TvApp
//
//  Created by Ilgiz Fazlyev on 15.03.2021.
//

import UIKit

class TimeStampLbl: UIView {


    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var labelView: UIView!
    private var time: Int?
    
    public init(frame: CGRect, time: Int?) {
        super.init(frame: frame)
        self.time = time
        loadXIB()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXIB()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXIB()
    }
    
    private func loadXIB() {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        let bundle = Bundle.init(for: TimeStampLbl.self)
        if let viewsToAdd = bundle.loadNibNamed(String(describing: TimeStampLbl.self), owner: self, options: nil),
           let contentView = viewsToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            if #available(iOS 13.0, *) {
                overrideUserInterfaceStyle = .light
            }
            
            configUI()
        }
        
    }


    private func configUI() {
        labelView.layer.cornerRadius = 8
        labelView.clipsToBounds = true
        labelView.backgroundColor = UIConstants.Colors.grey80
        timeLabel.font = UIConstants.Fonts.labelSemibold
        timeLabel.textColor = UIConstants.Colors.white100
        timeLabel.text = convertTimeFromSec(timeInSec: time)
    }
    
    private func convertTimeFromSec(timeInSec: Int?) -> String? {
        guard let time = timeInSec else {
            return nil
        }
        var formatTime = ""
        let hour = time / 3600
        let minute = time / 60 % 60
        let second = time % 60
        
        var secondSpaceLeft = minute == 0 ? "" : " "
        secondSpaceLeft = hour == 0 ? "" : " "
        let minutesSpaceLeft = hour == 0 ? "" : " "
        let minutesSpaceRight = second == 0 ? "" : " "
        var hoursSpaceRight = minute == 0 ? "" : " "
        hoursSpaceRight = second == 0 ? "" : " "
        
        if hour != 0 {
            formatTime += "\(hour) h\(hoursSpaceRight)"
        }
        
        if minute != 0 {
            formatTime += "\(minutesSpaceLeft)\(minute) min\(minutesSpaceRight)"
        }
        
        if second != 0 {
            formatTime += "\(secondSpaceLeft)\(second) sec"
        }
        
        return formatTime

    }
}
