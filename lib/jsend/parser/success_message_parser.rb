require_relative '../hash_utils'
require_relative '../responses/success_response'

module JSend

  class SuccessMessageParser

    def self.response_from_hash(hash)
      raise InvalidData if hash['data'].nil?
      raise InvalidData if HashUtils.has_fields_different_from(hash, %w(status data))

      SucessResponse.new hash['data']
    end

  end

  private_constant :SuccessMessageParser

end