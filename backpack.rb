class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # set up local variables used by rest of prepare method
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    # Ensure appropriate clothing is added to backpack
    pack_by_weather
    # Ensure gym shoes are added to backpack if it's a gym day
    gym_shoes
    # Bring a packed lunch on all weekdays
    pack_lunch
  end

  def pack_by_weather
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    if weather == 'rainy'
      rainy_weather
    elsif weather == 'cold'
      cold_weather
    else
      other_weather
    end
  end

  def rainy_weather
    @items << 'pants'
    @items << 'shirt'
    @items << 'umbrella'
  end

  def cold_weather
    @items << 'pants'
    @items << 'shirt'
    @items << 'jacket'
  end

  def other_weather
    @items << 'pants'
    @items << 'shirt'
  end

  def gym_shoes
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    if day_of_week == 'monday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end
  end

  def pack_lunch
    weather = @attributes[:weather]
    day_of_week = @attributes[:day_of_week]
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    elsif false
      @items << 'snacks'
    end
  end

  def summary
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
