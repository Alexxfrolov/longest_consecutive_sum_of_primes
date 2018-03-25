require_relative 'spec_helper'

describe LongestPrimeSum do
  it 'is equal 6' do
    res = described_class.new(EratosthenSieve.new(100).call).call
    expect(res.length).to eq 6
    expect(res.sum).to eq 41
  end

  it 'is equal 21' do
    res = described_class.new(EratosthenSieve.new(1_000).call).call
    expect(res.length).to eq 21
    expect(res.sum).to eq 953
  end
end
