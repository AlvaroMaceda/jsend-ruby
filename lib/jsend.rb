# frozen_string_literal: true

require "jsend/version"
require 'json'

module JSend

  SUCCESS = 'success'
  ERROR = 'error'
  FAIL = 'fail'

  def parse(json)
    values = JSON.parse(json)
    Response.class_for(values['status']).send(:from_hash, values)
  end

  def success(data)
    JSend::SucessResponse.new(data)
  end

  def fail(error_data)
    JSend::FailResponse.new(error_data)
  end

  def error(msg, code = nil, data = nil)
    JSend::ErrorResponse.new(data, msg, code)
  end

  module_function :parse, :success, :fail, :error

  class Response

    def self.class_for(type)
      case type
      when JSend::SUCCESS
        SucessResponse
      when JSend::ERROR
        ErrorResponse
      when JSend::FAIL
        FailResponse
      else
        raise 'Unsupported type of message'
      end
    end

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

  private

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

  class ErrorResponse < Response

    attr_reader :data, :message, :code

    def initialize(data = nil, msg = nil, code = nil)
      @status = JSend::ERROR
      @data = data
      @message = msg
      @code = code
    end

    def self.from_hash(hash)
      puts 'From hash de success'
    end

  end



end