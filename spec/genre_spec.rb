require_relative '../genre'

describe Genre do
  context 'when using the add_item method' do
    let(:genre) { Genre.new('Comedy') }
    let(:item) { double('Item', add_genre: nil) }

    it 'should add an item to the genre' do
      genre.add_item(item)

      expect(genre.items).to include(item)
    end

    it 'should call add_genre on the item with self as argument' do
      expect(item).to receive(:add_genre).with(genre)

      genre.add_item(item)
    end
  end
end
