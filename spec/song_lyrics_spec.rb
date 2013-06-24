require 'song_lyrics'

describe SongLyrics do
  describe '#valid?' do
    context 'when artist and title are present' do
      subject { valid_subject }
      its(:valid?) { should be_true }
    end

    context 'when artist or title are missing' do
      subject { invalid_subject }
      its(:valid?) { should be_false }
    end
  end

  describe '#fetch' do
    context 'when object instance is valid' do
      subject { valid_subject }
      it 'returns song lyrics' do
        subject.fetch.should_not be_nil
      end
    end

    context 'when object instance is invalid' do
      subject { invalid_subject }
      it 'returns nil' do
        subject.fetch.should be_nil
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