require_relative 'response'

module JSend

  class FailResponse < Response

    attr_reader :data

    def initialize(data)
      @status = JSend::FAIL
      @data = data
    end

    def self.from_hash(hash)
      puts 'From hash de success'
    end

  end

  private_constant :FailResponse

end