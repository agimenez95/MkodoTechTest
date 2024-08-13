//
//  MainViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 13/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class MainViewModelTests: XCTestCase {

    func testMainViewModel() {
        let sut = MainViewModel()
        XCTAssertNotNil(sut)
    }

    func testMainViewModel_getResults_lottoResults() async throws {
        let apiService = StubDataLottoResultsApiService()
        let sut = MainViewModel(apiService: apiService)
        await sut.getResults()
        XCTAssertEqual(sut.results.count, 3)
    }

    func testMainViewModel_getResults_calls_getLottoResults_in_LottoResultsApiService() async {
        let apiServiceSpy = LottoResultsApiServiceSpy()
        let sut = MainViewModel(apiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetLottoResults)

        await sut.getResults()
        XCTAssertTrue(apiServiceSpy.didCallGetLottoResults)
    }

}
