class Score
  # The name of the rating with an absolute majority for one's proposal
  attr_reader :name
  # The value of the rating with an absolute majority
  attr_reader :value
  # the amount of people who voted for at least this rating
  attr_reader :rating_count
  # the sum of all ratings value
  attr_reader :rating_sum
  # the proposal associated to the score
  attr_reader :proposal

  def initialize(proposal)
    @rating_count = 0

    @name = proposal.ratings.order(name: :desc).pluck(:name).tally.find do |name, amount|
      @rating_count += amount
      rating_count > proposal.survey.number_of_votes / 2
    end.first

    @value = Rating::NAMES[name]
    @proposal = proposal
    @rating_sum = proposal.ratings.sum(:name)
  end

  def <=>(other)
    return other.value <=> self.value if (other.value <=> self.value) != 0
    return other.rating_count <=> self.rating_count if (other.rating_count <=> self.rating_count) != 0

    other.rating_sum <=> self.rating_sum
  end

  def self.for(proposal)
    return NullScore.new(proposal) if proposal.ratings.none?

    Score.new(proposal)
  end

  class NullScore < Score
    def initialize(proposal)
      @name = "Waiting for votes"
      @value = -1
      @rating_count = 0
      @rating_sum = 0
      @proposal = proposal
    end
  end
end
