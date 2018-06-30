# frozen_string_literal: true

require 'jsend/version'
require 'json'

require_relative 'jsend/success_response'
require_relative 'jsend/fail_response'
require_relative 'jsend/error_response'
require_relative 'jsend/parser'

module JSend

  SUCCESS = 'success'
  ERROR = 'error'
  FAIL = 'fail'

  def parse(json)
    values = JSON.parse(json)
    Parser.parser_for(values['status']).response_from_hash(values)
  end

  def success(data)
    SucessResponse.new(data)
  end

  def fail(error_data)
    FailResponse.new(error_data)
  end

  def error(msg, code = nil, data = nil)
    ErrorResponse.new(data, msg, code)
  end

  module_function :parse, :success, :fail, :error

end