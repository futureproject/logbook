require 'rails_helper'

RSpec.describe "students/edit", :type => :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :school_id => 1,
      :grade => 1,
      :core => false
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_first_name[name=?]", "student[first_name]"

      assert_select "input#student_last_name[name=?]", "student[last_name]"

      assert_select "input#student_school_id[name=?]", "student[school_id]"

      assert_select "input#student_grade[name=?]", "student[grade]"

      assert_select "input#student_core[name=?]", "student[core]"
    end
  end
end
