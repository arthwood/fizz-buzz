class FizzBuzz
  def initialize(config)
    @config = config
  end

  def fetch(amount)
    (1..amount).map do |i|
      items = @config.select { |idx| (i % idx.to_i).zero? }.values
      items.empty? ? i : items.join
    end
  end
end
