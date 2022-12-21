//
//  cloudKituser.swift
//  singup
//
//  Created by modi on 20/05/1444 AH.
//

import SwiftUI
import CloudKit


class cloudKituserM: ObservableObject {
    @Published var permissionStatus: Bool = false
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    @Published var userName: String = ""
    init() {
        getiCloudStatus()
        requestPermission()
        fetchiCloudUserRecordID()
        
    }
    private func getiCloudStatus() {
        CKContainer.default().accountStatus { [weak self] returnedStatus, returnedError in DispatchQueue.main.async {
            switch returnedStatus {
            case .available:
                self?.isSignedInToiCloud = true
            case .noAccount:
                self?.error = CloudKitError.iCloudAccountNotFound.rawValue
            case .couldNotDetermine:
                self?.error = CloudKitError.iCloudAccountNotFound.rawValue
                
            case .restricted:
                self?.error = CloudKitError.iCloudAccountNotFound.rawValue
            default:
                self?.error = CloudKitError.iCloudAccountNotFound.rawValue
            }
        }
            
        }
        
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotFound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
        
    }
    
    func requestPermission() {
        CKContainer.default().requestApplicationPermission([.userDiscoverability]) { [weak self]
            returnedStatus, returnedError in
            DispatchQueue.main.async {
                if returnedStatus == .granted {
                    self?.permissionStatus = true
                }
            }
            
        }
    }
    
    func fetchiCloudUserRecordID() {
        CKContainer.default().fetchUserRecordID { [weak self] returnedID, returnedError in
            if let id = returnedID {
                self?.discoveriCloudUser(id: id)
            }
            
        }
    }
    
    func discoveriCloudUser(id: CKRecord.ID) {
        CKContainer.default().discoverUserIdentity(withUserRecordID: id) { [weak self] returnedIdentity, returnedError in DispatchQueue.main.async {
            if let name = returnedIdentity?.nameComponents?.givenName {
                self?.userName = name
            }
        } }
        
    }
    }
    
    
    struct cloudKituser: View {
        @StateObject private var vm =  cloudKituserM()
        
        var body: some View {
            VStack {
                
                
                Text("IS SIGN IN: \(vm.isSignedInToiCloud.description.uppercased())")
                Text(vm.error)
                Text("Permission: \(vm.permissionStatus.description.uppercased())")
                Text("NAME: \(vm.userName)")
            }
        }
    }
    
    struct cloudKituser_Previews: PreviewProvider {
        static var previews: some View {
            cloudKituser()
        }
    }
    
    
    
    

