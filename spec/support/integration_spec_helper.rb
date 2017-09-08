module IntegrationSpecHelper
  def login_with_oauth(service = :facebook)
    visit "/players/new"
  end
end
