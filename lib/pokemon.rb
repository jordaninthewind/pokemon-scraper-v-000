class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(pokemon)
    @name = :name
    @type = pokemon[:type]
    @db = pokemon[:db]
    @id = pokemon[:id]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(pokemon_info)
  end

end
