require_relative '../hash_utils'
require_relative '../responses/error_response'

module JSend

  class ErrorMessageParser

    def self.response_from_hash(hash)
      raise InvalidData if hash['message'].nil?
      raise InvalidData if HashUtils.has_fields_different_from(hash, %w(status message code data))

      ErrorResponse.new hash['data'],hash['message'],hash['code']
    end

  end

  private_constant :ErrorMessageParser

end