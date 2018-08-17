class FizzBuzz
  def initialize(config, criteria)
    @config = config
    @criteria = criteria
  end

  def fetch(amount)
    (1..amount).map do |i|
      items = @config.select { |idx| @criteria.any? { |criteria| criteria.call(i, idx) } }.values
      items.empty? ? i : items.join
    end
  end
end
