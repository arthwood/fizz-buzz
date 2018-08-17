require_relative '../app/fizz_buzz'

RSpec.describe FizzBuzz do
  subject { described_class.new config }

  let(:amount) { 15 }

  def run
    subject.fetch(amount)
  end

  context 'with empty config' do
    let(:config) { {} }

    it 'returns regular integers' do
      expect(run).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    end
  end

  context "display 'fizz' for even numbers" do
    let(:config) { { '2' => 'fizz' } }

    it 'returns expected result' do
      expect(run).to eq [1, 'fizz', 3, 'fizz', 5, 'fizz', 7, 'fizz', 9, 'fizz', 11, 'fizz', 13, 'fizz', 15]
    end
  end

  context "display 'fizz' for numbers divisible by 3 and 'buzz' for numbers divisible by '5'" do
    let(:config) { { '3' => 'fizz', '5' => 'buzz' } }

    it 'returns expected result' do
      expect(run).to eq [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']
    end
  end
end
