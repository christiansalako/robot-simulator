require 'rspec'
require_relative '../table'

describe Table do
  context 'when table is initialized' do
    it 'creates correct table size' do
      table = Table.new(5, 5)
      expect(table.valid_command?(4, 4)).to be true
      expect(table.valid_command?(5, 7)).to be false
    end
  end
end