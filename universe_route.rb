## Galactic trade routes
## You are the supreme ruler of the universe.

## You want to establish trade routes between your planets, to make your empire more prosperous.

## As an organized ruler, you have listed all your planets, their 3D coordinates, and their type. You identified two types: planets producing mainly food and needing metal, and planets producing mostly metal and needing food.

## Every food planet should have a trade route with at least one metal planet, and every metal planet should have a trade route with at least one food planet.

## Goods cannot transit on another planet after they arrive at their first destination. So obviously, connecting two planets of the same type is useless.

## A planet can exchange goods with multiple other planets. Multiple planet clusters, isolated from one another, can exist if every planet has a trade route to a complementary planet.



require 'matrix'

# define Planet class with coordinates and type
class Planet
  attr_reader :coordinates, :type

  def initialize(coordinates, type)
    @coordinates = Vector[*coordinates]
    @type = type
  end

  # distance to another planet
  def distance_to(other_planet)
    (coordinates - other_planet.coordinates).magnitude
  end
end

# find the minimum spanning tree
def minimum_spanning_tree(planets)
  # group planets by type
  food_planets = planets.select { |planet| planet.type == 'food' }
  metal_planets = planets.select { |planet| planet.type == 'metal' }

  # create graph
  graph = {}
  planets.each do |planet|
    graph[planet] = []
  end

  # add edges
  food_planets.each do |food_planet|
    # find closest metal planet
    closest_metal_planet = metal_planets.min_by { |metal_planet| food_planet.distance_to(metal_planet) }
    # add edge to graph
    graph[food_planet] << [closest_metal_planet, food_planet.distance_to(closest_metal_planet)]
  end

  metal_planets.each do |metal_planet|
    # find closest food planet
    closest_food_planet = food_planets.min_by { |food_planet| metal_planet.distance_to(food_planet) }
    # add edge to graph
    graph[metal_planet] << [closest_food_planet, metal_planet.distance_to(closest_food_planet)]
  end

  # run Kruskal's algorithm to find minimum spanning tree
  tree = []
  edges = []
  graph.each do |planet, planet_edges|
    planet_edges.each do |edge|
      edges << [edge[1], planet, edge[0]]
    end
  end
  edges.sort_by! { |edge| edge[0] }
  uf = {}
  graph.keys.each do |planet|
    uf[planet] = planet
  end
  edges.each do |edge|
    weight, u, v = edge
    root_u = find(uf, u)
    root_v = find(uf, v)
    if root_u != root_v
      tree << [u, v, weight]
      uf[root_u] = root_v
    end
  end

  tree
end

# find root of a node in a union-find data structure
def find(uf, node)
  if uf[node] != node
    uf[node] = find(uf, uf[node])
  end
  uf[node]
end
