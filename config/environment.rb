require 'sqlite3'

#STEP 1

# creating database
DB = {:conn => SQLite3::Database.new("db/songs.db")}

#drop songs to avoid error
DB[:conn].execute("DROP TABLE IF EXISTS songs")

#creating songs table
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

DB[:conn].execute(sql)

#when SELECT statement is executed don't return a database row as an array, 
#return it as hash with column names as keys
DB[:conn].results_as_hash = true


# example from .results_as_hash: DB[:conn].execute("SELECT * FROM songs LIMIT 1")
# returns not [[1, "Hello", "25"] but {'id'=>1, 'name'=>"Hello", 'album'=>"25", 0 => 1, 1 => "Hello", 2 => "25"}


