require_relative "../test_helper"

class RobotRepositoryTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

      robot = robot_repository.find(1)

      assert_equal "Sebastian Vettel", robot.name
      assert_equal "Happenheim", robot.city
      assert_equal "Germany", robot.state
      assert_equal "https://robohash.org/Sebastian_Vettel", robot.avatar
      assert_equal "07/03/1987", robot.birthdate
      assert_equal "01/01/2007", robot.date_hired
      assert_equal "F1 Driver Robot", robot.department
      assert_equal 1, robot.id
  end

  def test_we_can_find_all_robots
    robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(1)

    robot_repository.create({
      "id" => 2,
      "name" => "Fernando",
      "city" => "Jerez",
      "state" => "Spain",
      "avatar" => "https://robohash.org/Fernando",
      "birthdate" => "07/29/1981",
      "date_hired" => "01/01/2004",
      "department" => "F1 Driver Robot"
      })

    robot = robot_repository.find(2)
    assert_equal 2, robot_repository.all.length
  end

  def test_we_can_find_a_single_robot
    robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(1)

    robot_repository.create({
      :id => 2,
      :name => "Fernando Alonso",
      :city => "Jerez",
      :state => "Spain",
      :avatar => "https://robohash.org/Fernando",
      :birthdate => "07/29/1981",
      :date_hired => "01/01/2004",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(2)

    assert_equal "Sebastian Vettel", robot_repository.find(1).name
    assert_equal "Fernando Alonso", robot_repository.find(2).name
    assert_equal "Spain", robot_repository.find(2).state
    assert_equal "01/01/2007", robot_repository.find(1).date_hired
    assert_equal "F1 Driver Robot", robot_repository.find(1).department
  end

  def test_we_can_update_our_robots_info
    skip
    robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(1)

    assert_equal.update(1, {city: "Stockholm", state: "Sweden"})
    assert_equal "Stockholm", robot_repository.find(1).city
  end

  def test_we_can_destroy_a_robot
    robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(1)

    robot_repository.create({
      "id" => 2,
      "name" => "Fernando",
      "city" => "Jerez",
      "state" => "Spain",
      "avatar" => "https://robohash.org/Fernando",
      "birthdate" => "07/29/1981",
      "date_hired" => "01/01/2004",
      "department" => "F1 Driver Robot"
      })

    robot = robot_repository.find(2)
    assert_equal 2, robot_repository.all.length
    robot_repository.destroy(1)
    assert_equal 1, robot_repository.all.length
    robot_repository.destroy(2)
    assert_equal 0, robot_repository.all.size
  end

end
