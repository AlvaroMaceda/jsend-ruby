require_relative 'exceptions'
require_relative 'success_message_parser'

module JSend

  class Parser

    def self.parser_for(type)
      case type
      when JSend::SUCCESS
        SuccessMessageParser
      when JSend::ERROR
        # ErrorResponse
      when JSend::FAIL
        # FailResponse
      else
        raise JSend::InvalidType
      end
    end

  end





=begin

  class ErrorMessageParser

    def self.response_from_hash(hash)
      SucessResponse.new hash['data']
    end

  end

  class FailMessageParser

    def self.response_from_hash(hash)
      SucessResponse.new hash['data']
    end

  xend

=end




  private_constant :Parser
  private_constant :SuccessMessageParser
  # private_constant :ErrorMessageParser
  # private_constant :FailMessageParser

end

