require'test_helper'

class ListingUsersTest < ActionDispatch::IntegrationTest
  
  setup { host! 'localhost/api' }

  test 'returns user by id' do
  	get '/users'
  	assert_equal 200, response.status
  	refute_empty response.body
  end
end
