require 'spec_helper'

describe 'Fetch book data' do

  context "when a user initiates a search" do

    it "returns an array of book hashes when searching by title" do
      VCR.use_cassette('fetch_book_data_by_title') do
        @books = FetchBookData.new('The Martian Chronicles').parse_xml
      end

      expect(@books).to be_a(Array)
      expect(@books.first).to be_a_instance_of(Hash)
      expect(@books.first[:title]).to eq('The Martian Chronicles')
      expect(@books.first[:author]).to eq('Ray Bradbury')
    end

    it "returns an array of book hashes when searching by author" do
      VCR.use_cassette('fetch_book_data_by_author') do
        @books = FetchBookData.new('Ray Bradbury').parse_xml
      end

      expect(@books).to be_a(Array)
      expect(@books.first).to be_a_instance_of(Hash)
      expect(@books.first[:author]).to eq('Ray Bradbury')
    end

  end
end
