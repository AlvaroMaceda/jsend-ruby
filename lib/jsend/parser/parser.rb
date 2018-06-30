require_relative 'exceptions'
require_relative 'success_message_parser'
require_relative 'error_message_parser'
require_relative 'fail_message_parser'

module JSend

  class Parser

    def self.parser_for(type)
      case type
      when JSend::SUCCESS
        SuccessMessageParser
      when JSend::ERROR
        ErrorMessageParser
      when JSend::FAIL
        FailMessageParser
      else
        raise JSend::InvalidType
      end
    end

  end

  private_constant :Parser
  private_constant :SuccessMessageParser
  private_constant :ErrorMessageParser
  private_constant :FailMessageParser

end

