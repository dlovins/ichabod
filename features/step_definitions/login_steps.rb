After('@loggedin') do |scenario|
  ENV['PDS_HANDLE'] = nil
end

Given(/^I am logged in as "(.*?)"$/) do |user|
  ENV['PDS_HANDLE'] = format_pds_handle(user)
end

Then(/^I should see "Log-out"$/) do
  within(:css, "ul.nyu-login") do
    expect(page).to have_content("Log-out")
  end
end