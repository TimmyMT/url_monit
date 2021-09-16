require 'rails_helper'

RSpec.describe UrlItem, type: :model do
  it { should validate_presence_of(:url) }

  describe "validate format url" do
    context "when url is valid" do
      let(:url_https) { build :url_item }
      let(:url_http) { build :url_item, url: 'http://google.com' }

      it 'https return true value' do
        expect(url_https.valid?).to eq true
      end

      it 'http return true value' do
        expect(url_http.valid?).to eq true
      end
    end

    context "when url is invalid" do
      let(:url_1) { build :url_item, url: 'just string' }
      let(:url_2) { build :url_item, url: 'http:/google.com' }
      let(:url_3) { build :url_item, url: 'http:google.com' }
      let(:url_4) { build :url_item, url: 'https:google.com' }
      let(:url_5) { build :url_item, url: 'https:/google.com' }

      it 'case 1' do
        expect(url_1.valid?).to eq false
      end

      it 'case 2' do
        expect(url_2.valid?).to eq false
      end

      it 'case 3' do
        expect(url_3.valid?).to eq false
      end

      it 'case 4' do
        expect(url_4.valid?).to eq false
      end

      it 'case 5' do
        expect(url_5.valid?).to eq false
      end
    end
  end
end
