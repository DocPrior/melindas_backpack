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
    base_pack
    if weather == 'rainy'
      rainy_weather
    elsif weather == 'cold'
      cold_weather
    end
  end

  def base_pack
    @items << 'pants'
    @items << 'shirt'
  end

  def rainy_weather
    @items << 'umbrella'
  end

  def cold_weather
    @items << 'jacket'
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
    elsif
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
