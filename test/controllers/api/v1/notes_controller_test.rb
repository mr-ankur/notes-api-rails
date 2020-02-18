require 'test_helper'

class Api::V1::NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_note = api_v1_notes(:one)
  end

  test "should get index" do
    get api_v1_notes_url, as: :json
    assert_response :success
  end

  test "should create api_v1_note" do
    assert_difference('Api::V1::Note.count') do
      post api_v1_notes_url, params: { api_v1_note: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show api_v1_note" do
    get api_v1_note_url(@api_v1_note), as: :json
    assert_response :success
  end

  test "should update api_v1_note" do
    patch api_v1_note_url(@api_v1_note), params: { api_v1_note: {  } }, as: :json
    assert_response 200
  end

  test "should destroy api_v1_note" do
    assert_difference('Api::V1::Note.count', -1) do
      delete api_v1_note_url(@api_v1_note), as: :json
    end

    assert_response 204
  end
end
