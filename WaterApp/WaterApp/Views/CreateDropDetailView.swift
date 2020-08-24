//
//  CreateDropDetailView.swift
//  WaterApp
//
//  Created by David Fanaro on 8/24/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct CreateDropDetailView: View {
    
    @Binding var isPersented: Bool
    @State var title: String = ""
    @State var message: String = ""
    
    
    var body: some View {
        
        ZStack {
            
            
            
            //navigationBarItems(leading: )
            
            Image("AppBackground")
                .resizable() .edgesIgnoringSafeArea(.all).blur(radius: 10)
            
            
            
            
            VStack {
                
                
                Text("Create Drop")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(30.0)
                    .shadow(radius: 10)
                    .padding()
                
                
                
                
                TextField("Title", text: $title)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                .shadow(radius: 10)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                    
                
                
                TextView(text: self.$message)
                    .background(Color.gray.opacity(0.5))
                    .cornerRadius(30)
                    .padding()
                
                
                Spacer()
                
                Button(action: {
                   
                    self.isPersented = false
                }){
                    
                    VStack {
                        //[…]
                        Text("Post!")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.gray)
                            .cornerRadius(15.0)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                }
                Button(action: {
                    
                    self.isPersented = false
                }){
                    
                    VStack {
                        //[…]
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220/2, height: 60/2)
                            .background(Color.gray)
                            .cornerRadius(15.0/2)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                }
                
                
            }.onDisappear{
            }
        }
        
    }
}

//struct CreateDropDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateDropDetailView()
//    }
//}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UITextView {

        let myTextView = UITextView()
        myTextView.delegate = context.coordinator

        myTextView.font = UIFont(name: "HelveticaNeue", size: 30)
        myTextView.isScrollEnabled = true
        myTextView.isEditable = true
        myTextView.isUserInteractionEnabled = true
        myTextView.backgroundColor = UIColor(white: 0.0, alpha: 0.05)

        return myTextView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    class Coordinator : NSObject, UITextViewDelegate {

        var parent: TextView

        init(_ uiTextView: TextView) {
            self.parent = uiTextView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            print("text now: \(String(describing: textView.text!))")
            self.parent.text = textView.text
        }
    }
}

