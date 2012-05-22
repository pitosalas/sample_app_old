# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do
  subject { @user }

  before {@user = Factory.build(:user, :password => "123456", :password_confirmation => "123456")}
  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it "can have just a name" do
  	Factory.build(:user, email: nil, password: "123456", password_confirmation: "123456").should be_valid
  end
  it "cannot have just an email" do
  	Factory.build(:user, name: nil).should_not be_valid
  end

	it "shouldnt accept long names" do 
  	@user.name = "a"*100
		@user.should_not be_valid
	end

	it "should not accept a duplicate name" do
		u = Factory.build(:user, password: "123456", password_confirmation: "123456")
		u.name = @user.name
		u.save
		should_not be_valid
	end

  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:authenticate)}

  it "cant allow null password" do
    @user.password = @user.password_confirmation = ""
    @user.should_not be_valid
  end

  it "cant have mismatched password and validation" do
    @user.password = "1234567"
    @user.should_not be_valid
  end

  it "requires the email to be a valid email string"

  describe "authenticates a user with a valid password" do
    before do
      @user.save!
    end

    let(:found_user) { User.find_by_email(@user.email)}

    it "cant be null" do 
      found_user.should_not be_nil
    end
    it { should == found_user.authenticate(@user.password) }
  end


  describe "rejects a user with the wrong password" do
  end


end
