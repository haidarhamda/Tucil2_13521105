require_relative 'Algorithm.rb'
require_relative 'utils.rb'
require_relative 'plot.rb'

puts "number of points:"
n=gets.to_i
while n<2
    puts "ulangi input:"
    n=gets.to_i
end
puts "number of dimension:"
d=gets.to_i
while d<1
    puts "ulangi input:"
    d=gets.to_i
end
points= []
i=0
while i<n
    points.append([d.times.map{rand(-999.0..999.0)},i])
    i+=1
end
# points=points.sort_by{|item| item[0][0]}
points=quickSortPoint(points,0,points.length-1)

puts "divide and conquer:"
startdq=Time.now
pairs = divideNConquer(points)
finishdq=Time.now
print "distance: ",pairs[0]," between points: "
printPoint(getPointById(points,pairs[1]))
print " and "
printPoint(getPointById(points,pairs[2]))
print "\n"
print "number of euclidean distance calculation: ", EuclidCounter.new.getCount-1,"\n"
print "execution time: "
print finishdq-startdq,"s\n\n"


EuclidCounter.new.setToZero
startbf=Time.now
bf=bruteForce(points)
finishbf=Time.now
puts "brute force:"
print "distance: ",bf[0]," between points: "
printPoint(getPointById(points,bf[1]))
print " and "
printPoint(getPointById(points,bf[2]))
print "\n"
print "number of euclidean distance calculation: ", EuclidCounter.new.getCount-1,"\n"
print "execution time: "
print finishbf-startbf,"s\n"

plotPoints(points,getPointById(points,pairs[1]),getPointById(points,pairs[2]))
