//
//  Profile.swift
//  Skinsight
//
//  Created by Mario Alvarado on 01/08/23.
//


import JWTDecode

struct Profile {
    let id: String
    let name: String
    let nickname: String
    let email: String
    let emailVerified: String
    let picture: String
    let updatedAt: String
    
    // Private static variable to hold the single instance
    private static var sharedProfile: Profile?
    
    // Private initializer to prevent external instantiation
    private init(id: String, name: String, nickname: String, email: String, emailVerified: String, picture: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.email = email
        self.emailVerified = emailVerified
        self.picture = picture
        self.updatedAt = updatedAt
        self.nickname = nickname
    }
    
    // Public static method to access the shared instance
    static var shared: Profile {
        if let profile = sharedProfile {
            return profile
        } else {
            fatalError("Shared instance not initialized. Call setupSharedInstance() before accessing shared.")
        }
    }
    
    // Public static method to initialize the shared instance with the provided idToken
    static func setupSharedInstance(_ idToken: String) {
        guard
            let jwt = try? decode(jwt: idToken),
            let id = jwt.subject,
            let name = jwt.claim(name: "name").string,
            let nickname = jwt.claim(name: "nickname").string,
            let email = jwt.claim(name: "email").string,
            let emailVerified = jwt.claim(name: "email_verified").boolean,
            let picture = jwt.claim(name: "picture").string,
            let updatedAt = jwt.claim(name: "updated_at").string
        else {
            fatalError("Invalid idToken. Cannot create shared instance.")
        }
        
        sharedProfile = Profile(
            id: id,
            name: name,
            nickname: nickname,
            email: email,
            emailVerified: String(describing: emailVerified),
            picture: picture,
            updatedAt: updatedAt
        )
    }
}

