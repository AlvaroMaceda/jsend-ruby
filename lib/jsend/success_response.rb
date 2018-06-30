require_relative 'response'

module JSend

  class SucessResponse < Response

    attr_reader :data

    def initialize(data)
      @status = JSend::SUCCESS
      @data = data
    end

    public_class_method :new

  end

  private_constant :SucessResponse

end