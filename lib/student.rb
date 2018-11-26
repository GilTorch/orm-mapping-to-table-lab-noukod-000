class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :name,:grade
  attr_reader :id

  def initialize(name=nil,grade=nil,id=nil)
    @name=name
    @grade=grade
    @id=id
  end

  def self.create_table
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS students(id INTEGER PRIMARY KEY,name TEXT,grade INTEGER)")
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students")
  end

  def save
    sql="INSERT INTO students(name,grade) VALUES(?,?)"
    DB[:conn].execute(sql,self.name,self.age)
  end

end
