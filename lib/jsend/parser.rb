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
        raise 'Unsupported type of message'
      end
    end

  end

  class SuccessMessageParser

    def self.response_from_hash(hash)
      SucessResponse.new hash['data']
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

end

