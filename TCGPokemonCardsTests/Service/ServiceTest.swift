//
//  ServiceTest.swift
//  TCGPokemonCardsTests
//
//  Created by Yhan Nunes on 13/06/22.
//

import XCTest
@testable import TCGPokemonCards
class ServiceTest: XCTestCase {

    
    var showsService: PokemonService!

    override func setUp() {
           super.setUp()
           showsService = PokemonService(url: "https://api.pokemontcg.io/v2/cards?pageSize=30")
       }
       
       override func tearDown() {
           showsService = nil
           super.tearDown()
       }
       
       
       func testFetchAllPokemonCards() {
           // given
           let promise = expectation(description: "Return all pokemon cards")
           
           // when
           showsService.getJson(completion: { handler in
               handler.fold({ l in
                   XCTFail()
               }, {r in
                   XCTAssertTrue(r is [Cards])
                   promise.fulfill()
               })
           })
           
           waitForExpectations(timeout: 5, handler: nil)
       }

}
