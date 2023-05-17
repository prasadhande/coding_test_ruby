## Galactic trade routes

## You are the supreme ruler of the universe.


## You want to establish trade routes between your planets, to make your empire more prosperous.


## As an organized ruler, you have listed all your planets, their 3D coordinates, and their type. You identified two types: planets producing mainly food and needing metal, and planets producing mostly metal and needing food.


## Every food planet should have a trade route with at least one metal planet, and every metal planet should have a trade route with at least one food planet.


## Goods cannot transit on another planet after they arrive at their first destination. So obviously, connecting two planets of the same type is useless.


## A planet can exchange goods with multiple other planets. Multiple planet clusters, isolated from one another, can exist if every planet has a trade route to a complementary planet.


## Galactic trade routes


## How can you compute the trade routes to establish so that the sum of the distances is the lowest possible?


## You may not find an algorithm that guarantees to find an optimal solution. Just do your best!


## Your empire is excellent. Try to find an algorithm that does not take too much time to execute.

class Planet
  attr_reader :name, :produces, :needs

  def initialize(name, produces, needs)
    @name = name
    @produces = produces
    @needs = needs
  end

  def distance_to(other_planet)
      # Get the coordinates of this planet and the other planet.
  this_planet_coordinates = [this_planet.x, this_planet.y, this_planet.z]
  other_planet_coordinates = [other_planet.x, other_planet.y, other_planet.z]

  # Calculate the distance between the two sets of coordinates using the Pythagorean theorem.
  distance = Math.sqrt((this_planet_coordinates[0] - other_planet_coordinates[0])**2 +
                        (this_planet_coordinates[1] - other_planet_coordinates[1])**2 +
                        (this_planet_coordinates[2] - other_planet_coordinates[2])**2)

  # Return the distance.
  return distance
    # TODO: Implement this method to calculate the distance between this planet and the other planet.
  end
end



def find_trade_routes(planets)
  graph = Graph.new
  planets.each do |planet|
    graph.add_vertex(planet)
  end

  planets.each do |planet|
    planets.each do |other_planet|
      if planet != other_planet
        graph.add_edge(planet, other_planet, planet.distance_to(other_planet))
      end
    end
  end

  minimum_spanning_tree = graph.minimum_spanning_tree
  return minimum_spanning_tree.edges
end


planets = [
  Planet.new("A", "food", "metal"),
  Planet.new("B", "metal", "food"),
  Planet.new("C", "food", "metal"),
  Planet.new("D", "metal", "food"),
]

trade_routes = find_trade_routes(planets)

puts trade_routes
