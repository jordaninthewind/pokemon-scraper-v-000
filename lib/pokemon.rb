class Pokemon
attr_accessor :id, :name, :type, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_data = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    binding.pry
    Pokemon.new(@id = poke_data[0], @name = poke_data[1], @type = poke_data[2])
  end

  def initialize(pokemon)
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @id = pokemon[:id]
  end

end
