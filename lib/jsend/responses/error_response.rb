require_relative 'response'

module JSend

  class ErrorResponse < Response

    attr_reader :data, :message, :code

    def initialize(data = nil, msg = nil, code = nil)
      @status = JSend::ERROR
      @data = data
      @message = msg
      @code = code
    end

    public_class_method :new

  end

  private_constant :ErrorResponse

end