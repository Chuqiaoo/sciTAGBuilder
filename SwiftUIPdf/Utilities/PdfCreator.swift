//
//  PdfCreator.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import PDFKit

class PdfCreator : NSObject {
   
    private  var pageRect : CGRect
    
    private var renderer : UIGraphicsPDFRenderer?

    
    /**
     W: 8.5 inches * 72 DPI = 612 points
     H: 11 inches * 72 DPI = 792 points
     A4 = [W x H] 595 x 842 points
     */
    init(pageRect : CGRect = CGRect(x: 0, y: 0, width: (8.5 * 72.0), height: (11 * 72.0))) {
       
        let format = UIGraphicsPDFRendererFormat()
        let metaData = [
            kCGPDFContextTitle: "It's a PDF!",
            kCGPDFContextAuthor: "TechChee"
          ]
        format.documentInfo = metaData as [String: Any]
        
        self.pageRect = pageRect
        self.renderer = UIGraphicsPDFRenderer(bounds: self.pageRect,
                                             format: format)
        super.init()
    }
    
    deinit {
        
        self.renderer = nil
    }
   
}

extension PdfCreator {
    
    private func addType ( type  : String ){
        
        let typeRect = CGRect(x: 20, y: 20, // top margin
                              width: pageRect.width - 40 ,height: 40)

        type.draw(in: typeRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
      
    }
    
    //cgong
    private func addDate ( date  : String ){
        
        let dateRect = CGRect(x: 20, y: 70, // top margin
                              width: pageRect.width - 40 ,height: 80)

        date.draw(in: dateRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
      
    }
    
    private func addSampleName ( sampleName  : String ){
        
        let sampleNameRect = CGRect(x: 20, y: 120, // top margin
                              width: pageRect.width - 40 ,height: 120)

        sampleName.draw(in: sampleNameRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
      
    }
    
    private func addUser ( user  : String ){
        
        let userRect = CGRect(x: 20, y: 160, // top margin
                              width: pageRect.width - 40 ,height: 160)

        user.draw(in: userRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
      
    }
    
    private func addMoreInfo (moreInfo : String) {
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.foregroundColor : UIColor.gray
        ]
        
        let moreInfoRect = CGRect(x: 20, y: 200,
                              width: pageRect.width - 40 ,height: pageRect.height - 120)
        moreInfo.draw(in: moreInfoRect, withAttributes: attributes)
    }
}

extension PdfCreator {
    
    func pdfData( type : String, date: String, sampleName: String, user: String, moreInfo: String ) -> Data? {
        
        if let renderer = self.renderer {
       
            let data = renderer.pdfData  { ctx in
                
                ctx.beginPage()
                
                addType(type: "Type: " + type)
                
                //cgong
                addDate(date: "Date: " + date)
                
                addSampleName(sampleName: "Sample Name: " + sampleName)
                
                addUser(user: "User: " + user)
                
                addMoreInfo(moreInfo: moreInfo)
                
             //   addWaterMarkAtBottom()
            }
            
            return data

        }
        
        return nil
    }
}

extension PdfCreator {
    
    func pdfDoc( type : String, date: String, sampleName: String, user: String, moreInfo: String ) -> PDFDocument? {
        
        if let data = self.pdfData(type: type, date: date, sampleName: sampleName, user: user,  moreInfo: moreInfo){
            
            return PDFDocument(data: data)
        }
        
        return nil
    }
}


extension PdfCreator {
    
    func addWaterMarkAtBottom(){
     
        if let logo = UIImage(named: "techchee_logo") {
   
            let attributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor : UIColor.lightGray
            ]
            
            let logoAt = CGRect(x: pageRect.size.width - (logo.size.width + 10), y: pageRect.height - (logo.size.height + 10),
                                width: logo.size.width, height: logo.size.height)
            
            
            let textAt = CGRect (x: logoAt.origin.x - 102, y : logoAt.origin.y + 2, width:100, height: 30 )
            
            let text  = "Created By "
            
            text.draw(in : textAt, withAttributes : attributes)
           
            logo.draw(in: logoAt)
          
        }
    }
}
