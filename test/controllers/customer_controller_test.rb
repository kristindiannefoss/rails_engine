require 'test_helper'

class CustomerControllerTest < ActionController::TestCase
  test "#index" do
    get :index, format: :json
    parsed = JSON.parse(response.body)

    assert_response :success

  end
end
