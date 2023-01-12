require "test_helper"

class CorpEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get corp_events_index_url
    assert_response :success
  end
end
