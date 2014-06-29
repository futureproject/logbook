require 'rails_helper'

RSpec.describe "people/new", :type => :view do
  before(:each) do
    assign(:person, Person.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :role => "MyString",
      :school_id => 1,
      :grade => 1,
      :core => false
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_first_name[name=?]", "person[first_name]"

      assert_select "input#person_last_name[name=?]", "person[last_name]"

      assert_select "input#person_role[name=?]", "person[role]"

      assert_select "input#person_school_id[name=?]", "person[school_id]"

      assert_select "input#person_grade[name=?]", "person[grade]"

      assert_select "input#person_core[name=?]", "person[core]"
    end
  end
end
