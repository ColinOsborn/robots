require_relative "../test_helper"

class RobotTest < Minitest::Test

  def test_robot_get_assigned_correct_attributes
    robot = Robot.new({
      "id" => 1,
      "name" => "Fernando",
      "city" => "Jerez",
      "state" => "Spain",
      "avatar" => "https://robohash.org/Fernando",
      "birthdate" => "07/29/1981",
      "date_hired" => "01/01/2004",
      "department" => "F1 Driver Robot"
      })
    assert_equal "Fernando", robot.name
    assert_equal "Jerez", robot.city
    assert_equal "Spain", robot.state
    assert_equal "https://robohash.org/Fernando", robot.avatar
    assert_equal "07/29/1981", robot.birthdate
    assert_equal "01/01/2004", robot.date_hired
    assert_equal "F1 Driver Robot", robot.department
    assert_equal 1, robot.id
  end

end
