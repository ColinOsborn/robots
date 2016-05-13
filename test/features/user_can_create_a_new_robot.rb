require_relative "../test_helper"

class UserCanCreatANewRobot < FeatureTest
  def test_we_can_create_a_new_raikkonen_robot
    visit '/'

    click_link "New Robot Creation"

    # assert_equal '/robots/new', current_path
    # more of a implementation detail

    #TODO: leverage labels here instead
    fill_in 'robot[name]', with: "Kimi"
    fill_in 'robot[city]', with: "Espoo"
    fill_in 'robot[state]', with: "Finland"
    fill_in 'robot[birthdate]', with: "10/17/1979"
    fill_in 'robot[date_hired]', with: "01/01/2001"
    fill_in 'robot[department]', with: "The Ice Man"

    click_button "create robot"

    assert page.has_content?("Robot Name: Kimi")
    assert page.has_content?("City: Espoo")
    assert page.has_content?("State: Finland")
    assert page.has_content?("Birthdate: 10/17/1979")
    assert page.has_content?("Date Hired: 01/01/2001")
    assert page.has_content?("Department: The Ice Man")
    assert page.has_css?("img[src='https://robohash.org/Kimi.png']")
  end

end
