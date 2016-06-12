require 'song'

describe Song do
  subject { Song.new artist, title }

  before do
    allow(SongLyrics).to receive(:fetch) { "lalalalal" }
  end

  describe '.new' do
    context 'when artist or title blank' do
      let!(:artist) { '' }
      let!(:title)  { '' }

      it { expect(subject.title).to eq('') }
      it { expect(subject.artist).to eq('') }
    end

    context 'when artist or title nil' do
      let!(:artist) { nil }
      let!(:title)  { nil }

      it { expect(subject.title).to be(nil) }
      it { expect(subject.artist).to be(nil) }
    end

    context 'when valid query' do
      let(:artist) { 'Kaiser Chiefs' }
      let(:title)  { 'Ruby' }

      it { expect(subject.title).to eq(title) }
      it { expect(subject.artist).to eq(artist) }
    end
  end
end
