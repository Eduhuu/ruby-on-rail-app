require "test_helper"

class PublicationsControllerTest < ActionDispatch::IntegrationTest

  test 'render a list of publication' do
    get root_path

    assert_response :success 
  end

  test 'render a detail publication page' do
  
  end

end
