types = ['Fire', 'Water', 'Earth', 'Electric', 'Wind']

types.each_with_index do |type, index|
  MonsterType.find_or_create_by(name: type)
end

fire     = MonsterType.find_by(name: 'Fire')
water    = MonsterType.find_by(name: 'Water')
earth    = MonsterType.find_by(name: 'Earth')
electric = MonsterType.find_by(name: 'Electric')
wind     = MonsterType.find_by(name: 'Wind')

fire.update(over_power_id:  water.id)
water.update(over_power_id: earth.id)
earth.update(over_power_id: electric.id)
electric.update(over_power_id: wind.id)
wind.update(over_power_id:  fire.id)


