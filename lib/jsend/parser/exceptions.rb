module JSend

  class InvalidType < StandardError
    def message
      'Unsupported type of message'
    end
  end

  class InvalidData < StandardError
    def message
      'Incorrect JSend message'
    end
  end
end