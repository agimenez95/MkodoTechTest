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
        XCTAssertEqual(sut.lottoResults.count, 3)

        let date0 = sut.lottoResults[0].drawDate
        let date1 = sut.lottoResults[1].drawDate
        let date2 = sut.lottoResults[2].drawDate
        
        XCTAssertGreaterThan(date0, date1)
        XCTAssertGreaterThan(date1, date2)
    }

    func testAllResultsViewModel_getData_lottoResults_withInvalidDate_throwsError() async {
        let apiService = StubDataLottoResultsApiService(bundle: Bundle(for: type(of: self)),
                                                        fileName: Constant.invalidDatesJSONFileName)
        let sut = ResultsViewModelFactory.makeAllResultsViewModel(apiService: apiService)
        await sut.getData()
        XCTAssertEqual(sut.error, .decodingError)
    }

    func testAllResultsViewModel_getData_calls_getLottoResults_in_LottoResultsApiService() async {
        let apiServiceSpy = LottoResultsApiServiceSpy()
        let sut = ResultsViewModelFactory.makeAllResultsViewModel(apiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetLottoResults)
        
        await sut.getData()
        XCTAssertTrue(apiServiceSpy.didCallGetLottoResults)
    }
}

private extension AllResultsViewModelTests {

    enum Constant {
        static let invalidDatesJSONFileName = "InvalidDates"
    }
}
