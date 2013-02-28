require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :title => "MyString",
      :content => "MyString",
      :tags => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_title", :name => "project[title]"
      assert_select "input#project_content", :name => "project[content]"
      assert_select "input#project_tags", :name => "project[tags]"
      assert_select "input#project_user_id", :name => "project[user_id]"
    end
  end
end
