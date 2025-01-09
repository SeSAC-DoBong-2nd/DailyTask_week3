//
//  UIImageView+Extension.swift
//  DailyTask_week2
//
//  Created by 박신영 on 1/5/25.
//

import UIKit

import Kingfisher

extension UIImageView {
    
    func setImageViewUIWithKF(imageURL: String, cornerRadius: Int) {
        self.kf.setImage(with: URL(string: imageURL), options: [
            .transition(.none), // kf에 기본으로 내장된 페이드 애니메이션 비활성화
            .cacheOriginalImage, // 원본 이미지를 캐시에 저장. 이로써 추후 재다운로드 없이 재사용 가능.
        ])
        self.contentMode = .scaleAspectFill
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
    func setImage(with urlString: String, cornerRadius: Int) {
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
//        |>
//        RoundCornerImageProcessor(radius: Radius.point(CGFloat(cornerRadius)))
        self.kf.indicatorType = .activity  //이미지 다운로드 작업이 진행중일 때, 이미지 뷰에 인디케이터 설정.
        self.kf.setImage(
            with: URL(string: urlString),
            placeholder: UIImage(named: "placeholderImage"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        )
        self.layer.cornerRadius = CGFloat(cornerRadius)
    }
    
}
