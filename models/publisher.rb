require_relative('../db/sql_runner')

class Publisher

  attr_reader( :id, :name, :contact_details)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @contact_details = options["contact_details"]
  end



  def save()
      sql = "INSERT INTO publishers
      (
        name,
        contact_details
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @contact_details]
      results = SqlRunner.run(sql, values)
      @id = results.first()["id"].to_i
  end


  def update()
    sql = "UPDATE publishers
    SET
    (
      name,
      contact_details
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @contact_details, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM publishers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.all()
      sql = "SELECT * FROM publishers"
      results = SqlRunner.run(sql)
      return results.map { |publisher| Publisher.new(publisher) }
  end



  def self.find(id)
    sql = "SELECT * FROM publishers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Publisher.new(results.first)
  end


  def self.delete_all
    sql = "DELETE FROM publishers"
    SqlRunner.run(sql)
  end





  end
