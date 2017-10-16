import SafetyContracts
import SwiftyRequest

extension ProcessHandlerError {
    // :-/
    init(clientErrorCode: Int) {
        rawValue = 600 + clientErrorCode
    }

    public static var clientErrorUnknown = ProcessHandlerError(clientErrorCode: 0)
    public static var clientConnectionError = ProcessHandlerError(clientErrorCode: 1)
    public static var clientNoData = ProcessHandlerError(clientErrorCode: 2)
    public static var clientSerializationError = ProcessHandlerError(clientErrorCode: 3)
    public static var clientEncodingError = ProcessHandlerError(clientErrorCode: 4)
    public static var clientFileManagerError = ProcessHandlerError(clientErrorCode: 5)
    public static var clientInvalidFile = ProcessHandlerError(clientErrorCode: 6)
    public static var clientInvalidSubstitution = ProcessHandlerError(clientErrorCode: 7)
}

extension ProcessHandlerError {
    init(restError: RestError) {
        switch restError {
        case .erroredResponseStatus(let httpCode):
            guard let httpCode = Int(httpCode) else {
                self = .internalServerError // NOTE: Better default?
                return
            }
            self = ProcessHandlerError(httpCode: httpCode)
        case .noData: self = .clientNoData
        case .serializationError: self = .clientSerializationError
        case .encodingError: self = .clientEncodingError
        case .fileManagerError: self = .clientFileManagerError
        case .invalidFile: self = .clientInvalidFile
        case .invalidSubstitution: self = .clientInvalidSubstitution
        }
    }
}
