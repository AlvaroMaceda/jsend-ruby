require "spec_helper"

describe Jsend do

  it "has a version number" do
    expect(Jsend::VERSION).not_to be nil
  end

  let(:data) {
    {
        item1: 'itema',
        item2: 'itemb',
        item3: {foo: 'bar', tee: 'poo'},
        item4: ['asereje', 2, 45]
    }
  }

  describe '#sucess' do

      it 'Creates a message' do
        jsend_message = JSend.success(data)

        expect(jsend_message.success?).to be true
        expect(jsend_message.error?).to be false
        expect(jsend_message.fail?).to be false
        expect(jsend_message.data).to eq(data)
      end

      it 'Exports to JSON' do
        expected_json = {
            status: JSend::SUCCESS,
            data: data
        }.to_json

        generated_json = JSend.success(data).to_json

        expect(generated_json).to eq(expected_json)
      end

  end

  describe '#fail' do

    it 'creates a message' do
      jsend_message = JSend.fail(data)

      expect(jsend_message.fail?).to be true
      expect(jsend_message.success?).to be false
      expect(jsend_message.error?).to be false
      expect(jsend_message.data).to eq(data)
    end

    it 'Exports to JSON' do
      expected_json = {
          status: JSend::FAIL,
          data: data
      }.to_json

      generated_json = JSend.fail(data).to_json

      expect(generated_json).to eq(expected_json)
    end

  end

  describe '#error' do

    it 'creates a message with error message only' do
      error_message = 'Something failed'

      jsend_message = JSend.error(error_message)

      expect(jsend_message.error?).to be true
      expect(jsend_message.success?).to be false
      expect(jsend_message.fail?).to be false
      expect(jsend_message.message).to equal(error_message)
    end

    it 'creates a message with code and data' do
      error_message = 'Something failed very bad'
      error_code = 999

      jsend_message = JSend.error(error_message, error_code, data)

      expect(jsend_message.error?).to be true
      expect(jsend_message.message).to equal(error_message)
      expect(jsend_message.code).to equal(error_code)
      expect(jsend_message.data).to equal(data)
    end

    it 'Exports to JSON' do
      error_message = 'The server has burnt in flames'
      expected_json = {
          status: JSend::ERROR,
          message: error_message
      }.to_json

      generated_json = JSend.error(error_message).to_json

      expect(generated_json).to eq(expected_json)
    end

    it 'Eports a complete error message to JSON' do
      error_message = 'Your AWS instances let you in bankrupcy'
      error_code = -987
      expected_json = {
          status: JSend::ERROR,
          message: error_message,
          code: error_code,
          data: data
      }.to_json

      generated_json = JSend.error(error_message, error_code, data).to_json

      expect(generated_json).to eq(expected_json)
    end

  end

  describe 'parser' do

    xit 'Does not parse an incorrect message' do
      json_to_parse = {
          random_field: 'banana',
          crap: 'asereje'
      }.to_json

      jsend_message = JSend.parse(json_to_parse)

    end

    context 'Success messages' do

      it 'Parses from JSON' do

        json_to_parse = {
            status: JSend::SUCCESS,
            data: data
        }.to_json
        expected_data = JSON.parse(data.to_json)

        jsend_message = JSend.parse(json_to_parse)

        expect(jsend_message.success?).to be true
        expect(jsend_message.data).to eq(expected_data)
      end

      xit 'Does not parses a message with non allowed fields' do

      end

    end

    context 'Failure messages' do

      xit 'Parses from JSON' do

        message = {
            status: JSend::FAIL,
            data: data
        }
        json_to_parse = message.to_json
        expected_data = JSON.parse(data.to_json)

        jsend_message = JSend.parse(json_to_parse)

        expect(jsend_message.fail?).to be true
        expect(jsend_message.data).to eq(expected_data)
      end

    end

    context 'Error messages' do

      xit 'Parses from JSON' do
        error_message = 'Your AWS instances let you in bankrupcy'
        error_code = -987

        message = {
            status: JSend::ERROR,
            data: data,
            code: error_code,
            message: error_message
        }
        json_to_parse = message.to_json
        expected_data = JSON.parse(data.to_json)

        jsend_message = JSend.parse(json_to_parse)

        expect(jsend_message.error?).to be true
        expect(jsend_message.code).to eq(error_code)
        expect(jsend_message.message).to eq(error_message)
        expect(jsend_message.data).to eq(expected_data)

      end

    end

  end


end