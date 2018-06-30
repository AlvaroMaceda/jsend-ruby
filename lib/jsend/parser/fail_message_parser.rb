require_relative '../hash_utils'
require_relative '../responses/fail_response'

module JSend

  class FailMessageParser

    def self.response_from_hash(hash)
      raise InvalidData if hash['data'].nil?
      raise InvalidData if HashUtils.has_fields_different_from(hash, %w(status data))

      FailResponse.new hash['data']
    end

  end

  private_constant :FailMessageParser

end