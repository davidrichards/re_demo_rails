def token_dictionary
  @token_dictionary ||= [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
end

def random_token(n=8)
  (0...n).map { token_dictionary[rand(token_dictionary.length)] }.join
end

def score_dist
  @score_dist ||= Croupier::Distributions.poisson(lambda: 2)
end

def random_score
  [5 - score_dist.generate_number, 0].max
end

# Using Faker::Coffee.blend_name, why not? It sounds brand namey
def random_description
  Faker::Coffee.blend_name
end

def random_url(user_name)
  user_name ||= Faker::Internet.user_name
  Faker::Internet.url('example.com/', user_name)
end

def random_avatar_url(user_name)
  user_name ||= Faker::Internet.user_name
  Faker::Internet.url('example.com/', user_name + ".png")
end

def item_attributes
  user_name = Faker::Internet.user_name
  {
    description: random_description,
    url: random_url(user_name),
    avatar_url: random_avatar_url(user_name)
  }
end

def create_person!
  print '.'
  Person.create!(token: random_token)
end

def create_item!
  print '.'
  Item.create!(item_attributes)
end

def create_score!(person_id, item_id)
  value = random_score
  attributes = {person_id: person_id, item_id: item_id, value: value}
  print '.'
  Score.create!(attributes)
end

def set_core_records!(opts={})
  person_count = opts.fetch(:person_count, 50)
  item_count = opts.fetch(:item_count, 500)
  people = person_count.times.map {create_person!.id}
  items = item_count.times.map {create_item!.id}
  product = people.product(items)
  pairs = []
  pair_count = opts.fetch(:pair_count, 5000)
  pair_count = product.length if pair_count > product.length
  until pairs.length >= pair_count
    pairs |= [product.sample]
  end
  pairs.each do |(person_id, item_id)|
    create_score!(person_id, item_id)
  end
  true
end

set_core_records!
