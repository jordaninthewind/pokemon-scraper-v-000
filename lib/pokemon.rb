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
    db.execute("SELECT name, type, id FROM pokemon WHERE pokemon.id = ?", id)
  end

end
