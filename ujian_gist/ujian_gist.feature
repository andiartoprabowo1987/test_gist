#test menggunakan cucumber ruby dengan bahasa test case gherkin dengan
#framework capybara

@andiarto-test
Feature: Andiarto Gist Login-create-edit-delete-view

@andiarto @test-shopee
 Scenario: User will in gist login for create-edit-delete-view
 Given there is "user" who have git account
 When user visit gist page
 And "user" login using valid credential
 When user create a public gist
 Then user edit existing gist
 And user see the list of the gists