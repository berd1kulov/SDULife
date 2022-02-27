//
//  AddAnnouncementView.swift
//  SDULife
//
//  Created by Dias Berdikul on 03.02.2022.
//

import SwiftUI
import PhotosUI

struct AddAnnouncementView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let token = UserDefaults.standard.string(forKey: "token")
    
    @State var closePMode = false
    @State private var image = UIImage()
    @State private var showSheet = false
    @State private var name: String = ""
    @State private var title: String = ""
    @State private var description: String = ""
    @StateObject var viewModel = AnnouncementViewModel()
    let screenSize = UIScreen.main.bounds.size
    
    var body: some View {
        ZStack{
            VStack{
                TextField("Name", text: $name)
                    .frame(width: screenSize.width-64, height: 40)
                    .padding(7)
                
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 0.2)
                    )
                    .padding(.horizontal, 13)
                TextField("About", text: $title)
                    .frame(width: screenSize.width-64, height: 40)
                    .padding(7)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 0.2)
                    )
                    .padding(.horizontal, 13)
                TextField("Description...", text: $description)
                    .frame(width: screenSize.width-64, height: 40)
                    .padding(7)
                
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(lineWidth: 0.2)
                    )
                    .padding(.horizontal, 13)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .stroke(lineWidth: 0.2)
                        .frame(width: screenSize.width-50, height: 100)
                    VStack{
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .opacity(0.5)
                        Text("Add photo")
                            .opacity(0.5)
                    }
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                }
                .onTapGesture {
                    showSheet = true
                }
                    
                
                Spacer()
                Button(action: {
                    viewModel.addAnnouncementToServer(imageDatas: [self.image], user_id: UserDefaults.standard.string(forKey: "userID")!, title: title, description: description)
                    
                }, label: {
                    Text("Add now")
                        .frame(width: screenSize.width-50, height: 50)
                        .background((name.isEmpty || title.isEmpty || description.isEmpty) ? Color.gray : Color.brandPrimary)
                        .foregroundColor(.white)
                        .cornerRadius(2)
                        .padding()
                })
                    .disabled(name.isEmpty || title.isEmpty || description.isEmpty)
                
            }
            .navigationBarTitle("Announcement", displayMode: .inline)
            if viewModel.isLoading {
                LoadingView()
                
            }
                
        }
        .onChange(of: closePMode, perform: { newValue in
            if(newValue == true){
                presentationMode.wrappedValue.dismiss()
            }
        })
        
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
        .sheet(isPresented: $viewModel.isLoaded) {
            CongratsView(sheetActive: $viewModel.isLoaded, isClosed: $closePMode)
        }
        
        
    }
    
    
}

struct AddAnnouncementView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnnouncementView()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
}
