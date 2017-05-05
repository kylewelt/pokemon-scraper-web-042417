class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end

  def self.save(name, type, db, hp=60)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_info = db.execute("SELECT * FROM pokemon").flatten
    pokemon = {
      id: poke_info[0],
      name: poke_info[1],
      type: poke_info[2],
      db: db,
      hp: poke_info[3]
    }

    Pokemon.new(pokemon)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = 'Pikachu'", new_hp)
  end

end
