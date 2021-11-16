require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @room = @user.rooms.build(name: "room", content: "content", cost: 0, address: "address", picture: "picture")
  end
  
  test "should be valid" do
      assert @room.valid?
    end
  
  test "user id should be present" do
    @room.user_id = nil
    assert_not @room.valid?
  end
  
  test "content should be present" do
    @room.content = nil
    assert_not @room.valid?
  end
  
  test "content should be 140 maximum" do
    @room.content = "a" * 141
    assert_not @room.valid?
  end
  
  test "cost should be present" do
    @room.cost = nil
    assert_not @room.valid?
  end
  
  test "address should be present" do
    @room.address = nil
    assert_not @room.valid?
  end
  
  test "picture should be present" do
    @room.picture = nil
    assert_not @room.valid?
  end
end