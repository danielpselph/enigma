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

  

end
