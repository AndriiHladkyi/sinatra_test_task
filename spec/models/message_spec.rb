# spec/app_spec.rb
require 'spec_helper'

describe 'Test Sinatra Application' do
  let(:message) { Message.create(title: 'text test') }
  let(:invalid_message) { Message.new }
  describe 'message creating' do
    context 'valid message' do
      it 'create message' do
        expect(message).to be_valid
      end
    end

    context 'invalid message' do
      it 'does not create empty message' do
        invalid_message
        invalid_message.save
        expect(invalid_message).not_to be_valid
      end
    end
  end

  context 'check destroy method' do
    it 'message must be destroyed 1 ' do
      message.visits = 0
      message.hours = 1
      expect(message.delete_message?).to eq true
    end
    it 'message must be destroyed 2 ' do
      message.visits = 1
      message.hours = 0
      message.created_at = Time.now - 1
      expect(message.delete_message?).to eq true
    end
    it 'message must be saved' do
      message.visits = 1
      expect(message.visits_empty?).to eq false
    end
  end
end
