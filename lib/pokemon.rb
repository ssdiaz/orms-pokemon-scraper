class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize (id: nil, name:, type:, db:)
        @id = id 
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
            sql =  <<-SQL
            INSERT INTO pokemon (name, type) VALUES (?,?)
            SQL
            db.execute(sql, name, type)
            # or db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_number, db)
        sql = <<-SQL
            SELECT * 
            FROM pokemon
            WHERE id = ?
        SQL
        pokemon_found = db.execute(sql, id_number)[0]
        name = pokemon_found[1]
        type = pokemon_found[2]
        Pokemon.new(id: id_number, name: name, type: type, db: db)
        # answer:
            # pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
            # Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end


end
