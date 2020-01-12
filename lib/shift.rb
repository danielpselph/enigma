class Shift
  attr_reader :key, :date

  def initialize(key = (Array.new(5) {rand(0..9)}),
                date = Time.now.strftime("%d%m%y"))
    @key = key
    @date = date
  end

  def key_grouping
    new_keys = []
    key.split(//).each_cons(2) do |num|
      new_keys << num.join
    end
    new_keys
  end

  def key_grouping_int
    key_grouping.map do |key|
      key.to_i
    end
  end

  def squared_date
    (date.to_i ** 2).to_s
  end

  def offset_date
    squared_date[-4..-1].split(//)
  end

  def offset_date_int
    offset_date.map do |date|
      date.to_i
    end
  end


  # def shift_key
  #   final_keys = {}
  #   require "pry"; binding.pry
  # end


end
