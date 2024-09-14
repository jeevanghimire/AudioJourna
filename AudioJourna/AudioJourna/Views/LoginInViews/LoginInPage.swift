 

import SwiftUI


@MainActor
final class UserCheck: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var wrongText = false
    @Published var isLoggedIn = false

//    func signIn() async throws {
//        guard !email.isEmpty, !password.isEmpty else {
//            print("Email and Password are required")
//            return
//        }
//
//        do {
//            let checkData = try await AuthManager.shared.checkUser(email: email, password: password)
//            print("User Checked: \(checkData)")
//            isLoggedIn = true // Set to true on successful sign-in
//        } catch {
//            print("Error: \(error.localizedDescription)")
//            wrongText = true
//            isLoggedIn = false
//        }
//    }
}

struct LoginInPage: View {
    @StateObject var user = UserCheck()

    var body: some View {
        ZStack {
            
            Color(red: 243/255, green: 241/255, blue: 205/255)
                .ignoresSafeArea()
            
            VStack {
                // Logo Section
                Image("logo-color")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 100)
                
                // Email and Password Fields
                VStack(spacing: 20) {
                    // Email Field
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.brown)
                        TextField("Email...", text: $user.email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    
                    // Password Field
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.brown)
                        SecureField("Password...", text: $user.password)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Login Button
                Button(action: {
                    // Your login logic here
                }) {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 40)
                        .background(Color.brown)
                        .cornerRadius(30)
                }
                .padding(.top, 20)
                
                // Forgot Password
                NavigationLink(destination: ForgotPassword()) {
                    Text("Forgot Password?")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                }
                
                // Sign Up
                HStack {
                    Text("Don't have an account?")
                        .font(.headline)
                        .foregroundColor(.gray)
                    NavigationLink(destination: SignUpPage()) {
                        Text("Sign Up")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                        
                    }
                }
                .padding(.top, 20)
            }
            .padding()
        }
        
    }
        
}



    
    #Preview {
        LoginInPage()
    }


