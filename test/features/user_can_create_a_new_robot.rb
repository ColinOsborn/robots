require_relative "../test_helper"

class UserCanCreatANewRobot < FeatureTest
  def test_we_can_create_a_new_raikkonen_robot
    visit '/'

    click_link "New Robot Creation"

    assert_equal '/robots/new', current_path

    fill_in 'robot[name]', with: "Kimi Raikkonen"
    fill_in 'robot[city]', with: "Espoo"
    fill_in 'robot[state]', with: "Finland"
    fill_in 'robot[avatar]', with: "https://robohash.org/KimiRaikkonen"
    fill_in 'robot[birthdate]', with: "10/17/1979"
    fill_in 'robot[date_hired]', with: "01/01/2001"
    fill_in 'robot[department]', with: "The Ice Man"

    click_button "create robot"

    assert page.has_content?("Kimi Raikkonen")
  end

end
