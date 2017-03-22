require 'test_helper'

class AccountActivationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get account_activations_new_url
    assert_response :success
  end

end
