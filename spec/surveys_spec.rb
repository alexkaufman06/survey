require("spec_helper")

describe(Survey) do
  it("capitalizes the survey name before initialization") do
    test_survey = Survey.create({ :name => "customer preferences" })
    expect(test_survey.name()).to(eq("Customer preferences"))
  end

  it { should have_and_belong_to_many(:questions) }
end
