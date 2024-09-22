//
//  AuthorizationInterceptor.swift
//  RocketReserver
//
//  Created by Wellington Tatsunori Asahide on 2024-09-22.
//

import Apollo
import ApolloAPI
import Foundation
import KeychainSwift

class AuthorizationInterceptor: ApolloInterceptor {
  public var id: String = UUID().uuidString
  
  func interceptAsync<Operation>(chain: Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {
    let keychain = KeychainSwift()
    if let token = keychain.get(LoginView.loginKeychainKey) {
      request.addHeader(name: "Authorization", value: token)
    }
    chain.proceedAsync(request: request,
                       response: response,
                       completion: completion)
  }
}
