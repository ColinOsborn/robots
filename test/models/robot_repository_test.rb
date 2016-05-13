require_relative "../test_helper"

class RobotRepositoryTest < Minitest::Test
  include TestHelpers

  def test_it_creates_a_robot
    robot_id = robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

      robot = robot_repository.find(robot_id)

      assert_equal "Sebastian Vettel", robot.name
      assert_equal "Happenheim", robot.city
      assert_equal "Germany", robot.state
      assert_equal "https://robohash.org/Sebastian_Vettel", robot.avatar
      assert_equal "07/03/1987", robot.birthdate
      assert_equal "01/01/2007", robot.date_hired
      assert_equal "F1 Driver Robot", robot.department
      assert_equal robot_id, robot.id
  end

  def test_we_can_find_all_robots
    robot_id = robot_repository.create({
      :id => 1,
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id)

    robot_id = robot_repository.create({
      :id => 2,
      :name => "Fernando",
      :city => "Jerez",
      :state => "Spain",
      :avatar => "https://robohash.org/Fernando",
      :birthdate => "07/29/1981",
      :date_hired => "01/01/2004",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id)
    assert_equal 2, robot_repository.all.length
  end

  def test_we_can_find_a_single_robot
    robot_id1 = robot_repository.create({
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id1)

    robot_id = robot_repository.create({
      :name => "Fernando Alonso",
      :city => "Jerez",
      :state => "Spain",
      :avatar => "https://robohash.org/Fernando",
      :birthdate => "07/29/1981",
      :date_hired => "01/01/2004",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id)

    assert_equal "Sebastian Vettel", robot_repository.find(robot_id1).name
    assert_equal "Fernando Alonso", robot_repository.find(robot_id).name
    assert_equal "Spain", robot_repository.find(robot_id).state
    assert_equal "01/01/2007", robot_repository.find(robot_id1).date_hired
    assert_equal "F1 Driver Robot", robot_repository.find(robot_id).department
  end

  def test_we_can_update_our_robots_info
    robot_id = robot_repository.create({
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id)

    robot_repository.update(robot_id, {city: "Stockholm"})
    assert_equal "Stockholm", robot_repository.find(robot_id).city
  end

  def test_we_can_destroy_a_robot
    robot_id = robot_repository.create({
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id)

    robot_id1 = robot_repository.create({
      :name => "Fernando",
      :city => "Jerez",
      :state => "Spain",
      :avatar => "https://robohash.org/Fernando",
      :birthdate => "07/29/1981",
      :date_hired => "01/01/2004",
      :department => "F1 Driver Robot"
      })

    robot = robot_repository.find(robot_id1)
    assert_equal 2, robot_repository.all.length
    robot_repository.destroy(robot_id)
    assert_equal 1, robot_repository.all.length
    robot_repository.destroy(robot_id1)
    assert_equal 0, robot_repository.all.size
  end

end
