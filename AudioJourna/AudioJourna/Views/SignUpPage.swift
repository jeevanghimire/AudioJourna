//
//  SignUpPage.swift
//  AudioJourna
//
//  Created by Jeevan Ghimire on 9/13/24.
//

import SwiftUI



@MainActor
final class User: ObservableObject{
    @Published var firstName = ""
       @Published var lastName = ""
       @Published var email = ""
       @Published var password = ""
       @Published var popover = false
}


struct SignUpPage: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack(spacing: 20) { // Add vertical spacing between elements
            Image("logo-color")
            
            // First Name
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your First Name", text: $user.firstName)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Last Name
            HStack {
                Image(systemName: "person.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your Last Name", text: $user.lastName)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Email
            HStack {
                Image(systemName: "envelope.fill")
                    .foregroundColor(.gray)
                TextField("Enter Your Email", text: $user.email)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Password
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(.gray)
                SecureField("Enter Your Password", text: $user.password)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            // Sign Up Button
            Button(action: {
                // Sign up logic here
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(Color.brown)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.top, 40) // Add space before the button
        }
        .padding(.top, 50) // Add space at the top
    }
}

#Preview {
    SignUpPage()
}
