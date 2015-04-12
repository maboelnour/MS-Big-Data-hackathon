require 'csv'

borders = {}
locations = {}

CSV.foreach("./borders.csv", {headers: true}) do |row|

  locations[row[0]] = {} if locations[row[0]].nil?
  locations[row[0]]['lat'] = row[1]
  locations[row[0]]['long'] = row[2]

end

# CSV.foreach("./datasets/bwt-taf-2014-10-01--2014-12-31-en.csv", {headers: true}) do |row|

#   if borders[row[0]].nil?
    
#     borders[row[0]] = 0

#   else
#     borders[row[0]] += 1
#   end

# end

f = File.new("result.csv", "w")
CSV.foreach("./datasets/bwt-taf-2014-10-01--2014-12-31-en.csv", {headers: true}) do |row1|
  f.write [row1[0],row1[1],row1[2],row1[3],row1[4],locations[row1[0].to_s]['lat'],locations[row1[0].to_s]['long'],"\n"].join(",")
end
