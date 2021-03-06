//
//  ContentViewModel.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import Foundation
import PDFKit

class ContentViewModel : ObservableObject {
    
    @Published private var content  = Content()

    
    //cgong
    var labelType : String {
        
        get { content.labelType }
        
        set (newLabelType) {
            
            content.labelType = newLabelType
        }
    }

    
    var date : String {
        
        get { content.date }
        
        set (newDate) {
            
            content.date = newDate
        }
    }
    
    var sampleName : String {
        
        get { content.sampleName }
        
        set (newSampleName) {
            
            content.sampleName = newSampleName
        }
    }
    
    var user : String {
        
        get { content.user }
        
        set (newUser) {
            
            content.user = newUser
        }
    }
    

    var moreInfo : String {
        
        get { content.moreInfo }
        
        set(newMoreInfo) {
            
            content.moreInfo = newMoreInfo
        }
    }
}


extension ContentViewModel {
    
    func clear(){
        
        self.labelType = ""
        //cgong
        self.date = ""
        self.sampleName = ""
        self.user = ""
        self.moreInfo = ""
    }
}

extension ContentViewModel {
    
    
    func pdfData() -> Data? {
          return PdfCreator().pdfData( labelType: self.labelType, date: self.date, sampleName:self.sampleName, user: self.user, moreInfo: self.moreInfo)
      }
      
    func pdfDoc() -> PDFDocument? {
          let pdfCreator = PdfCreator()
          return pdfCreator.pdfDoc( labelType: self.labelType, date: self.date, sampleName:self.sampleName, user: self.user, moreInfo: self.moreInfo)
      }
    
}
