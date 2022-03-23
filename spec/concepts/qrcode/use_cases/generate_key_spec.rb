# frozen_string_literal: true

require 'rails_helper'

RSpec.describe QrCodes::UseCases::GenerateKey do
  describe '#call' do
    subject(:call_use_case) { described_class.new }

    let(:generated_key) { call_use_case.call }

    before do
      call_use_case
    end

    it 'generates random string key' do
      expect(generated_key).to be_a_kind_of(String)
    end

    it 'generates 16 character-long key' do
      expect(generated_key.length).to eq(16)
    end
  end
end
