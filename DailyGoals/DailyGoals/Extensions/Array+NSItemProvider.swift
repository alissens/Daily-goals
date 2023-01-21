//
//  Array+NSItemProvider.swift
//  DailyGoals
//
//  Created by Marcello Mascia on 21/01/2023.
//

import Foundation

enum DragAndDropError: Error {
	case fileNotSupported
}

extension Array where Element == NSItemProvider {

	func loadObjects(completion: @escaping (Result<URL, Error>) -> Void) -> Bool {

		guard let provider = first else { return false }

		if provider.canLoadObject(ofClass: URL.self) {
			_ = provider.loadObject(ofClass: URL.self) { object, error in
				if let url = object {
					completion(.success(url))
				} else if let error = error {
					completion(.failure(error))
				} else {
					completion(.failure(DragAndDropError.fileNotSupported))
				}
			}
			return true
		}

		return false
	}
}
