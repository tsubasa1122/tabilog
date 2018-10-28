require 'test_helper'

class WannagosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wannagos_index_url
    assert_response :success
  end

end
