require 'spec_helper'

describe ::ParamsConverter do
  describe 'check servie' do
    let(:service) { described_class.new(user_params) }
    let(:user_params) { { 'visits' => 2, 'hours' => 4.01, 'type' => type } }

    context 'after_hour' do
      let(:type) { 'after_hour' }
      it '#destroyable?' do
        expect(service.destroyable?).to eq true
      end
    end

    context 'after visit' do
      let(:type) { 'after_visit' }

      it 'visited?' do
        expect(service.visited?).to eq true
      end

      it 'visits_left' do
        expect(service.visits_left == 2).to eq true
      end

      it 'hours_left' do
        expect(service.hours_left == 4.01).to eq true
      end
    end
  end
end
