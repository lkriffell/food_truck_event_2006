class FoodTruck

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory[item] = quantity
  end

  def potential_revenue
    potential = 0
    @inventory.each do |item, quantity|
      potential += item.price[1..-1].to_f * quantity
    end
    potential
  end

end
