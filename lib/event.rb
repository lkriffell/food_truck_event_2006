class Event

  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
       truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.map do |truck|
      if truck.inventory.include?(item)
        truck
      end
    end.compact
  end

  # def total_inventory
  #   all_inventory = Hash.new()
  #   @food_trucks.each do |truck|
  #     truck.inventory.each do |item, amount|
  #       add_to_total_inventory(all_inventory, item, amount, truck)
  #     end
  #   end
  #   all_inventory
  # end
  #
  # def add_to_total_inventory(all_inventory, item, amount, truck)
  #   if all_inventory[item] == nil
  #     all_inventory[item] = Hash.new(0)
  #   else
  #     all_inventory[item][:quantity] += amount
  #     if all_inventory[item][:food_trucks] == 0
  #       all_inventory[item][:food_trucks] = [truck]
  #     else
  #       all_inventory[item][:food_trucks] << truck
  #     end
  #   end
  # end

  def sorted_item_list
    item_list = []
    @food_trucks.each do |truck|
      truck.inventory.keys.each do |item|
        item_list << item.name
      end
    end
    item_list.uniq.sort
  end
end
