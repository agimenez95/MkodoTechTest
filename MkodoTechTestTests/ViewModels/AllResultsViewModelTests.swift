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
        let sut = AllResultsViewModel()
        XCTAssertNotNil(sut)
    }

    func testAllResultsViewModel_getData_lottoResults_dateNewestFirst() async throws {
        let sut = AllResultsViewModel()
        try await sut.getData()
        XCTAssertEqual(sut.lottoResults.count, 3)

        guard let date0 = sut.lottoResults[0].drawDate,
              let date1 = sut.lottoResults[1].drawDate,
              let date2 = sut.lottoResults[2].drawDate else {
            XCTFail("All of the dates provided should be decodable")
            return
        }
        XCTAssertGreaterThan(date0, date1)
        XCTAssertGreaterThan(date1, date2)
    }

    func testAllResultsViewModel_getData_lottoResults_withInvalidDate_orderedAsTheyCome() async throws {
        let apiService = StubDataLottoResultsApiService(bundle: Bundle(for: type(of: self)), fileName: "InvalidDates")
        let sut = AllResultsViewModel(lottoResultsApiService: apiService)
        try await sut.getData()
        XCTAssertEqual(sut.lottoResults.count, 3)
        XCTAssertNil(sut.lottoResults[0].drawDate)
        XCTAssertNotNil(sut.lottoResults[1].drawDate)
        XCTAssertNil(sut.lottoResults[2].drawDate)
        XCTAssertEqual(sut.lottoResults[0].id, "draw-1")
        XCTAssertEqual(sut.lottoResults[1].id, "draw-2")
        XCTAssertEqual(sut.lottoResults[2].id, "draw-3")
    }

    func testAllResultsViewModel_getData_calls_getLottoResults_in_LottoResultsApiService() async throws {
        let apiServiceSpy = LottoResultsApiServiceSpy()
        let sut = AllResultsViewModel(lottoResultsApiService: apiServiceSpy)
        XCTAssertFalse(apiServiceSpy.didCallGetLottoResults)
        
        try await sut.getData()
        XCTAssertTrue(apiServiceSpy.didCallGetLottoResults)
    }
}
