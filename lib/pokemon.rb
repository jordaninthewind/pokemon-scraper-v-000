class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @id = pokemon[:id]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_data = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(poke_data[0], poke_data[1], poke_data[2], poke_data[3])
  end

end
