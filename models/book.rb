require_relative( '../db/sql_runner' )

class Book

  attr_reader( :id, :title, :author, :description, :stock_quantity,
    :buying_cost, :selling_price, :publisher_id)

  def initialize( options )
    @id = options["id"].to_i if options["id"]
    @title = options['title']
    @author = options['author']
    @description = options["description"]
    @stock_quantity = options["stock_quantity"].to_i
    @buying_cost = options["buying_cost"].to_i
    @selling_price = options["selling_price"]to_i
    @publisher_id = options["publisher_id"].to_i
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






end
