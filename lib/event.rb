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

  def total_inventory
    all_inventory = Hash.new()
    collect_items_and_values(all_inventory)
    all_inventory
  end

  def collect_items_and_values(all_inventory)
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        check_if_all_item_inventory_is_nil(all_inventory, item)
        all_inventory[item][:quantity] += amount
        collect_food_truck(all_inventory, item, truck)
      end
    end
  end

  def check_if_all_item_inventory_is_nil(all_inventory, item)
    if all_inventory[item].nil?
      all_inventory[item] = Hash.new(0)
    end
  end

  def collect_food_truck(all_inventory, item, truck)
    if all_inventory[item][:food_trucks] == 0
      all_inventory[item][:food_trucks] = [truck]
    else
      all_inventory[item][:food_trucks] << truck
    end
  end

  def sorted_item_list
    item_list = []
    @food_trucks.each do |truck|
      truck.inventory.keys.each do |item|
        item_list << item.name
      end
    end
    item_list.uniq.sort
  end

  def overstocked_items
    total_inventory.map do |item, who_sells_how_much|
      if who_sells_how_much[:quantity] > 50 && who_sells_how_much[:food_trucks].size > 1
        item
      end
    end.compact
  end
end
