require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "黄彬", email: "575395982@qq.com", password: "foobar", password_confirmation: "foobar" )
  end
  
  test "should be valid" do
    assert @user.valid?  
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
   
  test "name should not be to long" do
    @user.name = "a"*51
    assert_not @user.valid?
  end
 
  test "email should not be to long" do
    @user.email = "a"*256
    assert_not @user.valid?
  end
   
  test "email validation should accept valid address" do
    valid_address = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_address.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{ valid_address.inspect } should be valid"
    end
  end

  test "email validation should accept invalid address" do
    invalid_address = %w[user@exampleccom A_US-ERfoo.bar.org firstlast@foo alice+bobbaz.cn]
    invalid_address.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{ invalid_address.inspect } should be invalid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    #不区分大小写，说明大写和小写都是同一个单词，这样说明是重复了，所以valid? 返回0
    @user.save    
    assert_not duplicate_user.valid? 
  end
  
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a"*5
    assert_not @user.valid?
  end
end




