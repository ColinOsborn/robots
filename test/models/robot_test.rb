require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_robot_get_assigned_correct_attributes
    robot = Robot.new({
      "id" => 1,
      "name" => "Fernando",
      "city" => "Jerez",
      "state" => "Spain",
      "birthdate" => "07/29/1981",
      "date_hired" => "01/01/2004",
      "department" => "F1 Driver Robot"
      })
    assert_equal "Fernando", robot.name
    assert_equal "Jerez", robot.city
    assert_equal "Spain", robot.state
    assert_equal "07/29/1981", robot.birthdate
    assert_equal "01/01/2004", robot.date_hired
    assert_equal "F1 Driver Robot", robot.department
    assert_equal 1, robot.id
  end

  def test_it_can_generate_avatar
    robot = Robot.new({
      :name => "Fernando"
      })
    assert_equal "https://robohash.org/Fernando.png", robot.avatar
  end

  def test_it_will_correct_spaces_in_url
    robot = Robot.new({
      :name => "Colin Osborn"
      })
    assert_equal "https://robohash.org/ColinOsborn.png", robot.avatar
  end

end
