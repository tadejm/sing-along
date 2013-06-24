require 'song'

describe Song do
  subject { Song.new artist, title }

  before do
    SongLyrics.stub(:fetch).and_return("lalalalal")
  end

  describe '.new' do
    context 'when artist or title blank' do
      let!(:artist) { '' }
      let!(:title)  { '' }

      its(:title) { should eq('') }
      its(:artist) { should eq('') }
    end

    context 'when artist or title nil' do
      let!(:artist) { nil }
      let!(:title)  { nil }

      its(:title) { should be_nil }
      its(:artist) { should be_nil }
    end

    context 'when valid query' do
      let(:artist) { 'Kaiser Chiefs' }
      let(:title)  { 'Ruby' }

      its(:title) { should eq(title) }
      its(:artist) { should eq(artist) }
    end
  end
end