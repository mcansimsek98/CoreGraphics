//
//  ViewController.swift
//  Project27
//
//  Created by Mehmet Can Şimşek on 16.08.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectangle()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 7 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectangle()
        case 1:
            drawCircle()
        case 2:
            drawCheckerboard()
        case 3:
            drawRotaSquares()
        case 4:
            drawLines()
        case 5:
            drawWord()
        case 6:
            drawEmoji()
        case 7:
            drawImagesAndTetx()
        default:
            break
        }
    }
    
    //deneme
    
    func drawWord() {
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
            
            let image = renderer.image { ctx in
                ctx.cgContext.translateBy(x: 100, y: 140)
                ctx.cgContext.setLineCap(.round)
                ctx.cgContext.setLineWidth(2)
                ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
                
                //  T
                ctx.cgContext.move(to: CGPoint(x: 5, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 105, y: 5))
                ctx.cgContext.move(to: CGPoint(x: 55, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 55, y: 105))
                
                //  W
                ctx.cgContext.move(to: CGPoint(x: 110, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 110, y: 105))
                ctx.cgContext.addLine(to: CGPoint(x: 160, y: 55))
                ctx.cgContext.addLine(to: CGPoint(x: 210, y: 105))
                ctx.cgContext.addLine(to: CGPoint(x: 210, y: 5))
                
                // I
                ctx.cgContext.move(to: CGPoint(x: 215, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 235, y: 5))
                ctx.cgContext.move(to: CGPoint(x: 225, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 225, y: 105))
                ctx.cgContext.move(to: CGPoint(x: 215, y: 105))
                ctx.cgContext.addLine(to: CGPoint(x: 235, y: 105))
                
                // N
                ctx.cgContext.move(to: CGPoint(x: 240, y: 105))
                ctx.cgContext.addLine(to: CGPoint(x: 240, y: 5))
                ctx.cgContext.addLine(to: CGPoint(x: 300, y: 105))
                ctx.cgContext.addLine(to: CGPoint(x: 300, y: 5))
                
                ctx.cgContext.strokePath()
            }
            
            imageView.image = image
    }
    
    func drawEmoji() {
           let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
           let image = renderer.image { ctx in
               // Draw big ellipse
               let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
               ctx.cgContext.setFillColor(UIColor.yellow.cgColor)
               ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
               ctx.cgContext.setLineWidth(5)
               
               ctx.cgContext.addEllipse(in: rectangle)
               ctx.cgContext.drawPath(using: .fillStroke)
               
               // Draw eyes
               let eye1 = CGRect(x: 112, y: 150, width: 75, height: 75)
               ctx.cgContext.setFillColor(UIColor.black.cgColor)
               ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
               ctx.cgContext.setLineWidth(1)
               
               ctx.cgContext.addEllipse(in: eye1)
               ctx.cgContext.drawPath(using: .fillStroke)
               
               let eye2 = CGRect(x: 325, y: 150, width: 75, height: 75)
               ctx.cgContext.setFillColor(UIColor.black.cgColor)
               ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
               ctx.cgContext.setLineWidth(1)
               
               ctx.cgContext.addEllipse(in: eye2)
               ctx.cgContext.drawPath(using: .fillStroke)
               
               // Draw mouth
               ctx.cgContext.setLineCap(.round)
               ctx.cgContext.setLineWidth(20)
               ctx.cgContext.move(to: CGPoint(x: 112, y: 350))
               ctx.cgContext.addLine(to: CGPoint(x: 400, y: 350))
               ctx.cgContext.strokePath()
           }
           
           imageView.image = image
       }
    //deneme sonu
    
    
    func drawImagesAndTetx() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
           let img = renderer.image { ctx in
               let paragraphStyle = NSMutableParagraphStyle()
               paragraphStyle.alignment = .center
               
               let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle
               ]
               let str = "The best-laid schemes o'\nmice an' men gang aft agley"
               let attributedStr = NSAttributedString(string: str, attributes: attrs)
               
               attributedStr.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, context: nil)
               
               let mouse = UIImage(named: "mouse")
               mouse?.draw(at: CGPoint(x: 300, y: 150))
           }
           imageView.image = img
    }
    
    func drawLines() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
        let img = renderer.image { ctx in
            ctx.cgContext.translateBy(x: 256, y: 256)
            
            var first = true
            var length: CGFloat = 256
            
            for _ in 0 ..< 256 {
                ctx.cgContext.rotate(by: .pi / 2)
                
                if first {
                    ctx.cgContext.move(to: CGPoint(x: length, y: 50))
                    first = false
                }else {
                    ctx.cgContext.addLine(to: CGPoint(x: length, y: 50))
                }
                length *= 0.99
            }
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.strokePath()
        }
        imageView.image = img
    }
    
    func drawRotaSquares() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
           let img = renderer.image { ctx in
               ctx.cgContext.translateBy(x: 256, y: 256)
               
               let rotations = 16
               let amount = Double.pi / Double(rotations)
               
               for _ in 0 ..< rotations {
                   ctx.cgContext.rotate(by: CGFloat(amount))
                   ctx.cgContext.addRect(CGRect(x: -128, y: -128, width: 256, height: 256))
               }
               ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
               ctx.cgContext.strokePath()
           }
           imageView.image = img
        
    }
    
    func drawCheckerboard() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
           let img = renderer.image { ctx in
               ctx.cgContext.setFillColor(UIColor.black.cgColor)
               for row in 0..<8 {
                   for col in 0..<8 {
                       if (row + col).isMultiple(of: 2) {
                           ctx.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                       }
                   }
               }
           }
           imageView.image = img
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
           
           let img = renderer.image { ctx in
               //awesome drawing code
               let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)
               
               ctx.cgContext.setFillColor(UIColor.red.cgColor)
               ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
               ctx.cgContext.setLineWidth(10)
               
               ctx.cgContext.addEllipse(in: rectangle)
               ctx.cgContext.drawPath(using: .fillStroke)
           }
           imageView.image = img
    }
    
    func drawRectangle() {
     let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let img = renderer.image { ctx in
            //awesome drawing code
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
        imageView.image = img
    }
    
}

