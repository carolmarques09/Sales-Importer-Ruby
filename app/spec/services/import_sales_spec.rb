require './app/services/import_sales'

describe ImportSales do
  it 'calculates total correctly' do
    file = File.open('example_input.tab')
    total = ImportSales.call(file)

    expect(total).to be > 0
  end
end
