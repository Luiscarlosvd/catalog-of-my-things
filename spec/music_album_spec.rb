require_relative '../music_album'
require_relative '../item'

describe MusicAlbum do
  context 'when using the can_be_archive? method with a publish_date older than 10 years' do
    let(:music_album) { MusicAlbum.new('2003/02/03') }
    it 'returns true when on_spotify is true and method from item class returns true' do
      music_album.on_spotify = true
      expect(music_album.send(:can_be_archived?)).to be true
    end
  end

  context 'when using the can_be_archive? method with a publish_date younger than 10 years' do
    let(:music_album2) { MusicAlbum.new(Time.now) }
    it 'returns false when on_spotify is false or if method from item class returns false' do
      music_album2.on_spotify = true
      expect(music_album2.send(:can_be_archived?)).to be false
    end
  end
end
