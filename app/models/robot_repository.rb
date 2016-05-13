
class RobotRepository
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def table
    database.from(:robots).order(:id)
  end

  def create(robot)
    table.insert(name: robot[:name], city: robot[:city], state: robot[:state], avatar: robot[:avatar], birthdate: robot[:birthdate], date_hired: robot[:date_hired], department: robot[:department])
  end

  # def raw_robots
  #   database.transaction do
  #     database['robots'] || []
  #   end
  # end

  def all
    table.to_a.map { |robot| Robot.new(robot)}
  end

  def raw_robot(id)
    table.where(:id => id).to_a.first
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, data)
    table.where(:id => id).update(data)
  end

  def destroy(id)
    table.where(:id => id).delete
  end

  def delete_all
    table.delete
  end
end
