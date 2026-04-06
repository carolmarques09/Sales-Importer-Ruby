require './app/models/item'

describe Item do
  it 'is invalid without description' do
    item = Item.new(price: 10)
    expect(item.valid?).to be false
  end
end
