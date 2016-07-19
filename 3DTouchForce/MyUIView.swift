//
//  MyUIView.swift
//  3DTouchForce
//
//  Created by JHJG on 2016. 7. 18..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class MyUIView: UIView {

    var size:CGFloat = 0
    
    override func drawRect(rect: CGRect) {
        let view_width = self.bounds.width
        let view_height = self.bounds.height
        //화면의 가시 영역의 높이와 폭의 값을 식별하여 size 변수에 정의된 높이까지 화면의 하단에서 시작되는 빨간 사각형을 그린다.
        let context = UIGraphicsGetCurrentContext()
        let rectangle = CGRectMake(0, view_height - size, view_width, size)
        CGContextAddRect(context, rectangle)
        CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
        CGContextFillRect(context, rectangle)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouch(touches)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        handleTouch(touches)
    }
    
    //사각형을 다시 그리도록한다.
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        size = 0
        self.setNeedsDisplay()
    }

    //터치들의 세트에서 첫번째 터치 객체를 추출하고 해당 객체의 force 속성에 접근한다.
    func handleTouch(touches:Set<UITouch>){
        let touch = touches.first
        
        //터치 힘을 바탕으로 높이 값을 계산하여 size 변수에 할당한다.
        size = touch!.force * 100
        //화면을 다시 그리는 명령을 실행하여 drawRect 메서드가 호출되면 새로운 size값을 이용해 사각형이 다시 그려질 것이다.
        self.setNeedsDisplay()
    }

}
