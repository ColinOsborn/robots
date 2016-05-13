require_relative "../test_helper"


class UserCanSeeAllRobots < FeatureTest

  def test_user_can_see_all_robots
    robot_repository.create({
      :name => "Sebastian Vettel",
      :city => "Happenheim",
      :state => "Germany",
      :avatar => "https://robohash.org/Sebastian_Vettel",
      :birthdate => "07/03/1987",
      :date_hired => "01/01/2007",
      :department => "F1 Driver Robot"
      })

    robot_repository.create({
      :name => "Fernando Alonso",
      :city => "Jerez",
      :state => "Spain",
      :avatar => "https://robohash.org/Fernando",
      :birthdate => "07/29/1981",
      :date_hired => "01/01/2004",
      :department => "F1 Driver Robot"
      })

      visit '/robots'

      assert page.has_content?("1")
      assert page.has_content?("Sebastian Vettel")
      save_and_open_page
      assert page.has_content?("2")
      assert page.has_content?("Fernando Alonso")
    end
end
