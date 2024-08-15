//
//  AllResultsViewModelTests.swift
//  MkodoTechTestTests
//
//  Created by Adriano Gimenez on 12/08/2024.
//

@testable import MkodoTechTest
import XCTest

final class AllResultsViewModelTests: XCTestCase {

    func testAllResultsViewModel() {
        let sut = ResultsViewModelFactory.makeAllResultsViewModel()
        XCTAssertNotNil(sut)
    }

    func testAllResultsViewModel_getData_lottoResults_dateNewestFirst() async {
        let sut = ResultsViewModelFactory.makeAllResultsViewModel()
        await sut.getData()
        XCTAssertEqual(sut.draws.count, 3)

        let date0 = sut.draws[0].drawDate
        let date1 = sut.draws[1].drawDate
        let date2 = sut.draws[2].drawDate

        XCTAssertGreaterThan(date0, date1)
        XCTAssertGreaterThan(date1, date2)
    }

    func testAllResultsViewModel_getData_lottoResults_withInvalidDate_throwsError() async {
        let apiService = StubDrawsApiService(fileName: Constant.invalidDatesJSONFileName)
        let sut = ResultsViewModelFactory.makeAllResultsViewModel(apiService: apiService)
        await sut.getData()
        XCTAssertEqual(sut.error, .decodingError)
    }

    func testAllResultsViewModel_getData_calls_getLottoResults_in_LottoResultsApiService() async {
        let apiServiceSpy = DrawsApiServiceSpy()
        let sut = ResultsViewModelFactory.makeAllResultsViewModel(apiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetDraws)

        await sut.getData()
        XCTAssertTrue(apiServiceSpy.didCallGetDraws)
    }
}

private extension AllResultsViewModelTests {

    enum Constant {
        static let invalidDatesJSONFileName = "InvalidDates"
    }
}
