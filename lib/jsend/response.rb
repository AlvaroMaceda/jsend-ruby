module JSend

  class Response

    def to_json
      data = {status: @status, message: @message, code: @code, data: @data}
      relevant_data = data.keep_if { |_, v| !v.nil? }
      relevant_data.to_json
    end

    def success?
      @status == JSend::SUCCESS
    end

    def fail?
      @status == JSend::FAIL
    end

    def error?
      @status == JSend::ERROR
    end

  end

  private_constant :Response

end