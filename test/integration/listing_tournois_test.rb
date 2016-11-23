require'test_helper'

class ListingTournoisTest < ActionDispatch::IntegrationTest
  
  setup { host! 'api.localhost' }

  test 'returns list of all tournois' do
  	get '/tournois'
  	assert_equal 200, response.status
  	refute_empty response.body
  end
end
