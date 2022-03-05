//
//  NotificationView.swift
//  SDULife
//
//  Created by Bakdaulet Berdikul on 25.11.2021.
//

import SwiftUI

struct NotificationView: View {
    
    @StateObject var viewModel = NotificationViewModel()
    let currentDate = "\(Date().formatDate())".replacingOccurrences(of: ".", with: "/").replacingOccurrences(of: ",", with: "")
    @State var todayIsVisible: Bool = true
    @State var earlierIsVisible: Bool = true
    var body: some View {
        NavigationView{
            ZStack{
                RefreshableScrollView(content: {
                    VStack(alignment: .leading){
                        ForEach(viewModel.notifications) {notification in
                            if("\(Date().formatDate())".replacingOccurrences(of: ".", with: "/").replacingOccurrences(of: ",", with: "").split(separator: " ")[0] == notification.created_at.split(separator: " ")[0]){
                                
//                                Text("Today")
//                                    .font(.system(size: 13))
//                                    .opacity(0.5)
                                    
                                
                                NotificationCell(notification: notification, currentTime: currentDate)
                                Divider()
                            }else{
//                                Text("Earlier")
//                                    .font(.system(size: 13))
//                                    .opacity(0.5)
                                NotificationCell(color: Color.gray, notification: notification, currentTime: currentDate)
                                Divider()
                            }
                        }
                        if(viewModel.currentPage < viewModel.totalPage){
                            ProgressView()
                                .padding()
                                .onAppear{
                                    viewModel.currentPage = viewModel.currentPage + 1
                                    viewModel.getNotifications()
                                }
                        }
                    }
                    .padding()
                }, onRefresh: { control in
                    viewModel.totalPage = 1
                    viewModel.currentPage = 1
                    viewModel.lastPageNotLoaded = true
                    viewModel.notifications.removeAll()
                    viewModel.getNotifications()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                        control.endRefreshing()
                    }
                })
                if (viewModel.isLoading && viewModel.notifications.isEmpty) {
                    LoadingView()
                }
            }
            .onAppear {
                viewModel.getNotifications()
            }
            .navigationBarTitle("Notification", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: {}, label: {
                    Image("calendar")
                })
                    .disabled(true)
            )
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}


extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd/MM/yyyy HH:mm")
            return dateFormatter.string(from: self)
        }
}
