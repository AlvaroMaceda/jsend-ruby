require_relative 'response'

module JSend

  class FailResponse < Response

    attr_reader :data

    def initialize(data)
      @status = JSend::FAIL
      @data = data
    end

    public_class_method :new

  end

  private_constant :FailResponse

end