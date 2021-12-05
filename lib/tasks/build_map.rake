namespace :build_map do
  noise_data_file = "lib/tasks/data/Hałas drogowy  LDWN.json"
  bike_data_file = "lib/tasks/data/TrasyRowerowe.geojson"
  accidents_data_file = "lib/tasks/data/2021_I_II_III_kwartal_szczegoly_zdarzen.json"

  file_accidents = File.open(Rails.root.join(accidents_data_file).to_s)
  file_contents = file_accidents.read
  accidents_data = JSON.parse(file_contents)
  tile_size = 0.0008
  keys = ["CR_PIESI", "LR_PIESI", "Z_PIESI", "POJ_ROWER"]
  map = {}

  result = accidents_data[0]["data"]["allData"].each do |accident|
    properties = accident[0]["properties"]
    value = keys.reduce(0) { |sum, key| sum + properties[key] }
    next if value.zero?
    x = accident[0]["geometry"]["coordinates"][1]
    y = accident[0]["geometry"]["coordinates"][0]
    x = x - (x % tile_size)
    y = y - (y % tile_size)
    key = [x,y]
    if map.key?(key)
      map[key] += value
    else
      map[key] = value
    end
  end

  bike_file = File.open(Rails.root.join(bike_data_file).to_s)
  bike_file_contents = bike_file.read
  bike_data = JSON.parse(bike_file_contents)


  noise_file = File.open(Rails.root.join(noise_data_file).to_s)
  noise_file_contents = noise_file.read
  noise_data = JSON.parse(noise_file_contents)

  res = noise_data[0]["data"]["allData"].each do |noise|
    noise[0]["geometry"]["coordinates"][0].each do |coords|
      x = coords[1]
      y = coords[0]

      x = x - (x % tile_size)
      y = y - (y % tile_size)

      key = [x,y]
      if map.key?(key)
        map[key] += 0.2
      else
        map[key] = 0.2
      end
    end
  end
  map['min'] = map.values.min
  map['max'] = map.values.max

  f = File.new("map.json", "w")
  f.write(map.to_json)
end
