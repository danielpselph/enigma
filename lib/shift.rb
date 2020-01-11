class Shift

  def initialize(key = Array.new(5) {rand(0..9)},
                date = Time.now.strftime("%d%m%y").to_i)
    @key = key
    @date = date
  end

end
