require_relative '../../app/fizz_buzz'

RSpec.describe FizzBuzz do
  subject { described_class.new config, criteria }

  let(:amount) { 15 }
  let(:criteria_1) { ->(i, idx) { (i % idx.to_i).zero? } }
  let(:criteria_2) { ->(i, idx) { i.to_s.include?(idx) } }

  def run
    subject.fetch(amount)
  end

  context 'with no criteria' do
    let(:criteria) { [] }

    context 'with simple config' do
      let(:config) { { '2' => 'fizz' } }

      it 'returns regular integers' do
        expect(run).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      end
    end
  end

  context 'with simple criteria' do
    let(:criteria) { [criteria_1] }

    context 'with empty config' do
      let(:config) { {} }

      it 'returns regular integers' do
        expect(run).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      end
    end

    context 'with simple config' do
      let(:config) { { '2' => 'fizz' } }

      it "display 'fizz' for even numbers" do
        expect(run).to eq [1, 'fizz', 3, 'fizz', 5, 'fizz', 7, 'fizz', 9, 'fizz', 11, 'fizz', 13, 'fizz', 15]
      end
    end

    context 'with extended config' do
      let(:config) { { '3' => 'fizz', '5' => 'buzz' } }

      it "display 'fizz' for numbers divisible by 3 and 'buzz' for numbers divisible by '5'" do
        expect(run).to eq [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 13, 14, 'fizzbuzz']
      end
    end
  end

  context 'with extended criteria' do
    let(:criteria) { [criteria_1, criteria_2] }

    context 'with empty config' do
      let(:config) { {} }

      it 'returns regular integers' do
        expect(run).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
      end
    end

    context 'with simple config' do
      let(:config) { { '3' => 'fizz' } }

      it "display 'fizz' for divisible by 3 or containing 3" do
        expect(run).to eq [1, 2, 'fizz', 4, 5, 'fizz', 7, 8, 'fizz', 10, 11, 'fizz', 'fizz', 14, 'fizz']
      end
    end

    context 'with extended config' do
      let(:config) { { '3' => 'fizz', '5' => 'buzz' } }
      let(:amount) { 51 }

      it "display 'fizz' for numbers divisible by 3 or containing 3 and 'buzz' for numbers divisible by 5 or containing 5" do # rubocop:disable Metrics/LineLength
        result = run
        expect(result.first(15)).to eq(
          [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 'fizz', 14, 'fizzbuzz']
        )

        expect(result.last(3)).to eq [49, 'buzz', 'fizzbuzz']
      end
    end
  end
end
