require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get frontpage" do
    get pages_frontpage_url
    assert_response :success
  end

  test "should get about" do
    get pages_about_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get faqs" do
    get pages_faqs_url
    assert_response :success
  end

  test "should get terms" do
    get pages_terms_url
    assert_response :success
  end

  test "should get privacy" do
    get pages_privacy_url
    assert_response :success
  end

  test "should get careers" do
    get pages_careers_url
    assert_response :success
  end

end
