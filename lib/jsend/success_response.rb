require_relative 'response'

module JSend

  class SucessResponse < Response

    attr_reader :data

    def initialize(data)
      @status = JSend::SUCCESS
      @data = data
    end

    def self.from_hash(hash)
      puts 'From hash de success'
    end

  end

  private_constant :SucessResponse

end