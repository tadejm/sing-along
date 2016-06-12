require 'song_lyrics'

describe SongLyrics do
  describe '#valid?' do
    context 'when artist and title are present' do
      subject { valid_subject }
      it { expect(subject.valid?).to be(true) }
    end

    context 'when artist or title are missing' do
      subject { invalid_subject }

      it { expect(subject.valid?).to be(false) }
    end
  end

  describe '#fetch' do
    context 'when object instance is valid' do
      subject { valid_subject }
      it 'returns song lyrics' do
        expect(subject.fetch).to_not be(nil)
      end
    end

    context 'when object instance is invalid' do
      subject { invalid_subject }
      it 'returns nil' do
        expect(subject.fetch).to be(nil)
      end
    end
  end

  def valid_subject
    spawn_subject 'Kaiser Chiefs', 'Ruby'
  end

  def invalid_subject
    spawn_subject nil, ''
  end

  def spawn_subject(artist, title)
    described_class.new(artist, title)
  end
end
