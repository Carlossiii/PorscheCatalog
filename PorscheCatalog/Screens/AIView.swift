//
//  AIView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 03/01/23.
//

import SwiftUI

struct AIView: View {
    @State var isPresenting: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @StateObject var carData = CarData()
    
    @ObservedObject var classifier: ImageClassifier
    
    @Binding var selection: TablView.Item
    @EnvironmentObject var truth: SourceOfTruth
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Group {
                        if let imageClass = classifier.imageClass {
                            HStack {
                                Text("You model is the:")
                                    .font(.title2)
                                
                                Button(action: {
                                    self.selection = .first
                                    self.truth.searchText = imageClass
                                }) {
                                    Text(imageClass)
                                        .font(.title2)
                                }
                            }
                        } else {
                            HStack{
                                Text("You model is the: -")
                                    .font(.title2)
                            }
                        }
                    }
                    .font(.subheadline)
                }
                
                ZStack {
                    Text("Tap to import the picture")
                    
                    Rectangle()
                        .foregroundColor(.black)
                        .opacity(0.0)
                        .overlay(
                            Group {
                                if uiImage != nil {
                                    Image(uiImage: uiImage!)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        )
                        .padding(.vertical)
                }
                .onTapGesture {
                    isPresenting.toggle()
                }
                
                Picker("Select the source", selection: $sourceType) {
                    Label("Gallery", systemImage: "photo").tag(UIImagePickerController.SourceType.photoLibrary)
                    Label("Camera", systemImage: "camera").tag(UIImagePickerController.SourceType.camera)
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
                Button("Analize") {
                    classifier.detect(uiImage: uiImage!)
                }
                .buttonStyle(.borderedProminent)
                .tint(.darkBackground)
                .simultaneousGesture(TapGesture().onEnded {
                    simpleSuccess()
                })
                .disabled(uiImage == nil)
            }
            .sheet(isPresented: $isPresenting){
                ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
            }
        }
        .padding()
        .padding(.bottom, 50)
    }
}


struct AIView_Previews: PreviewProvider {
    static var previews: some View {
        AIView(classifier: ImageClassifier(), selection: .constant(.first))
    }
}
