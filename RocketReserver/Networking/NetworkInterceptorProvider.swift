//
//  NetworkInterceptorProvider.swift
//  RocketReserver
//
//  Created by Wellington Tatsunori Asahide on 2024-09-22.
//

import Apollo
import ApolloAPI
import Foundation

class NetworkInterceptorProvider: DefaultInterceptorProvider {
  override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
    var interceptors = super.interceptors(for: operation)
    interceptors.insert(AuthorizationInterceptor(), at: 0)
    return interceptors
  }
}
