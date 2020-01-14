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
  #   final_keys[:A] = offset_date_int[0] + key_grouping_int[0]
  #   final_keys[:B] = offset_date_int[1] + key_grouping_int[1]
  #   final_keys[:C] = offset_date_int[2] + key_grouping_int[2]
  #   final_keys[:D] = offset_date_int[3] + key_grouping_int[3]
  #   final_keys
  # end

  def shift_key
    final_keys = []
    final_keys << offset_date_int[0] + key_grouping_int[0]
    final_keys << offset_date_int[1] + key_grouping_int[1]
    final_keys << offset_date_int[2] + key_grouping_int[2]
    final_keys << offset_date_int[3] + key_grouping_int[3]
    final_keys
  end


end
