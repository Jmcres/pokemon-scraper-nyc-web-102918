class Pokemon
    attr_accessor :id, :name, :type, :db
    @@all =[]

    def initialize (id:, name:, type:, db:)
        @id=id
        @name=name 
        @type=type
        @db=db
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find (id, db)
        pokemon_ins = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten 
        Pokemon.new(id: pokemon_ins[0], name: pokemon_ins[1], type: pokemon_ins[2], db: db)
    end

    def self.all
        @@all
        end

end
