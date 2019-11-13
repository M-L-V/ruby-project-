require_relative( '../db/sql_runner' )



class Book

  attr_reader( :title, :author, :description, :stock_quantity,
    :buying_cost, :selling_price, :publisher_id, :id)

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @author = options["author"]
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i
    @buying_cost = options["buying_cost"].to_f
    @selling_price = options["selling_price"].to_f
    @publisher_id = options["publisher_id"]
  end


  def save()
    sql = "INSERT INTO books
    (
      title,
      author,
      description,
      stock_quantity,
      buying_cost,
      selling_price,
      publisher_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    RETURNING id"
    values = [@title, @author, @description, @stock_quantity,
    @buying_cost, @selling_price, @publisher_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end



  def update()
    sql = "UPDATE books
    SET
    (
      title,
      author,
      description,
      stock_quantity,
      buying_cost,
      selling_price,
      publisher_id
    ) =
    (
      $1, $2, $3, $4, $5, $6, $7
    )
    WHERE id = $8"
    values = [@title, @author, @description, @stock_quantity,
    @buying_cost, @selling_price, @publisher_id, @id]
    SqlRunner.run(sql, values)
  end


  def delete()
    sql = "DELETE FROM books
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def publisher()
    sql = "SELECT * FROM publisher
    WHERE id = $1"
    values = [@publisher_id]
    results = SqlRunner.run(sql, values)
    return Publisher.new(results.first)
  end


  def self.all()
      sql = "SELECT * FROM books"
      results = SqlRunner.run( sql )
      return results.map { |book| Book.new(book) }
  end


  def self.find(id)
      sql = "SELECT * FROM books
      WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      return Book.new(results.first)
  end


  def self.delete_all
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end


  def self.markup()
    profit = @selling_price.to_f - @buying_cost.to_f
    markup_amount = (profit/@buying_cost.to_f) * 100
    return markup_amount.round(2)
  end







end
