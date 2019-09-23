//
//  SignUpViewModel.swift
//  myProf
//
//  Created by Ngoc Le on 18.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Combine

class SignUpViewModel: ObservableObject, Identifiable {
    
    typealias InputType = Input

    private var cancellables: [AnyCancellable] = []
    
    // MARK: Input
    enum Input {
        case onSubmit(name: String, email: String, password: String, confirmPassword: String)
    }
    
    func apply(_ input: Input) {
        switch input {
        case .onSubmit(let name, let email, let password, let confirmPassword):
            onSubmitSubject.send((name, email, password, confirmPassword))
        }
    }
    
    private let onSubmitSubject = PassthroughSubject<(String, String, String, String), Never>()
    
    // MARK: Output
    
    @Published private(set) var user: User = User.unregistered
    @Published var isErrorShown = false
    @Published var isCompleted = false
    @Published var errorMessage = ""
    
    private let responseSubject = PassthroughSubject<User, Never>()
    private let errorSubject = PassthroughSubject<APIError, Never>()
    private let finishedSubject = PassthroughSubject<Bool, Never>()
    
    private let apiService: APIServiceType
    
    init(apiService: APIServiceType = APIService()) {
        self.apiService = apiService
        
        bindInputs()
        bindOutputs()
    }
    
    private func bindInputs() {
        let responsePublisher = onSubmitSubject
            .map { (name, email, password, confirmPassword) in
                SignUpServiceRequest(name: name, email: email, password: password)
            }
            .flatMap { [apiService] request in
                apiService.response(from: request)
                    .catch { [weak self] error -> Empty<User, Never> in
                        self?.errorSubject.send(error)
                        return .init()
            }
        }
        
        let responseStream = responsePublisher
            .share()
            .subscribe(responseSubject)
        
        cancellables += [
            responseStream
        ]
    }
    
    private func bindOutputs() {
        let signUpStream = responseSubject
            .assign(to: \.user, on: self)
        
        let isCompletedStream = responseSubject
            .map { !$0.email.isEmpty }
            .assign(to: \.isCompleted, on: self)
        
        let errorMessageStream = errorSubject
            .map { error -> String in error.localizedDescription }
            .assign(to: \.errorMessage, on: self)
        
        let errorStream = errorSubject
            .map { _ in true }
            .assign(to: \.isErrorShown, on: self)
        
        cancellables += [
            signUpStream,
            isCompletedStream,
            errorStream,
            errorMessageStream,
        ]
    }
}
