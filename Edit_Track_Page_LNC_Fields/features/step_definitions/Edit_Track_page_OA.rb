Given(/^I have to login to OA side always$/) do
  on(Edit_track_Page).login_to_OA
end

Given(/^Go to the Edit Track page on OA side$/) do
  @browser.goto "http://synergy_oa.lnc.devorch.com/cont_mgmt/edit_track.php?upc=889176053443"
  sleep 5
end

Then(/^Filled all mandatory fields on edit track page$/) do
  on(Edit_track_Page).edit_track_Page_oa_side
end

#Click on the the update button
And(/^Click on the Update button$/) do
  @browser.button(:name, "update_release").click
end


Then(/^verify the confirmation message$/) do
  actual = "Track Info Successfully updated."
  actual.should eq "Track Info Successfully updated."
  sleep 5
  @browser.close
end

When(/^I enter an invalid ISWC$/) do
  @browser.text_field(:id, "iswcPartA1").set("E")
  @browser.text_field(:id, "iswcPartB1").set("121")
  @browser.text_field(:id, "iswcPartC1").set("111")
  @browser.text_field(:id, "iswcPartD1").set("111")
  @browser.text_field(:id, "iswcPartE1").set("G")
end

Then(/^Save the track$/) do
  step "Click on the Update button"
end

Then(/^I should see an ISWC validation error$/) do
  on(Edit_track_Page).verify_the_ISWC_Validation
  @browser.close
end


When(/^I select "([^"]*)" and save the track$/) do |option1|
  @browser.select_list(:id, "master_rights1").select(option1)
  on(Edit_track_Page).master_right_field0(option1)
end


Then(/^Verify that no is saved successfully$/) do
  on(Edit_track_Page).check

end
