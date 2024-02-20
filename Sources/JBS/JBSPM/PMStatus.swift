//
//  PMStatus.swift
//
//
//  Created by Justin Means on 10/21/23.
//

import Foundation

public enum PMStatus: String, DTO, CaseIterable {
    case backlog
    case todo
    case stalled
    case inProgress
    case inReview
    case done
    case canceled
    case triage

    public var title: String {
        return switch self {
        case .backlog:
            "Backlog"
        case .todo:
            "Todo"
        case .stalled:
            "Stalled"
        case .inProgress:
            "In Progress"
        case .inReview:
            "In Review"
        case .done:
            "Done"
        case .canceled:
            "Canceled"
        case .triage:
            "Triage"
        }
    }
}
