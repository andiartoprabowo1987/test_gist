#file page_steps to connect page object logic with scenario

 Given(/^there is "([^"]*)" who have git account$/) do |actor|
  case actor
  when "user"
  @username = ENV['USERNAME']
  @password = ENV['PASSWORD']
 end

 And(/^"([^"]*)" login using valid credential$/) do |actor|
  case actor
  when "user"
  @browser.login(@username, @password)
 end

 When(/^user visit gist page$/) do
  @browser = ujian.new
  @browser.load
 end

 When(/^user create a public gist$/) do
  @browser = ujian.new
  @browser.page_home
  @browser.TXT_GIST_FILENAME.click
  @browser.fill_in 'TXT_GIST_FILENAME', with: 'test-qagist-andiarto'
  expect(page).to have_css('TXT_GIST_CODE', text: 'Hello World')
  scroll_down(50)
  @browser.BTN_CREATE_PUBLIC_GIST.click
  expect(page).to have_css('LBL_MY_GIST', contains: 'qa-gist')
 end

 Then(/^user edit existing gist$/) do
  @browser.BTN_EDIT_GIST.click
  page.should have_contains(“/edit", visible: true)
  @browser.TXT_GIST_DESC.clear
  @browser.fill_in Trial Gist Edited’, with: 'andiartotest-edit'
  page.should have_contains(“andiarto-edit", visible: true)
  @browser.TXT_GIST_FILENAME.clear
  @browser.fill_in TXT_GIST_FILENAME’, with: ‘andiartotest-edit2’
  page.should have_contains(“andiarto-edit2”, visible: true)
  @browser.fill_in TXT_GIST_FILENAME’, with: ‘andiartotest-edit2’
  page.should have_contains(“andiarto-edit2”, visible: true)
  @browser.TXT_GIST_CODE.clear
  @browser.fill_in TXT_GIST_CODE’, with: ‘andiartotest-edit3’
  page.should have_contains(“andiarto-edit3”, visible: true)
  @browser.fill_in TXT_GIST_CODE’, with: ‘andiartotest-edit3’
  page.should have_contains(“andiarto-edit2”, visible: true)
  @browser.BTN_SUBMIT_EDIT_GIST.click
  sleep(5)
  page.should have_contains(“LBL_MY_GIST", text: qa-gist-1.md)
 end

 And(/^user see the list of the gists$/) do
  @browser.BTN_PROFILE.click
  wait_for_BTN_VIEW_MY_GISTS(5)
  @browser.BTN_VIEW_MY_GISTS.click
  page.should have_contains(“LBL_GIST_SNIPPET")
  page.should have_contains(“BL_BLANK_LIST_GIST", You don’t have any gists yet.)
 end
 