require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

get("/admin") do
  @surveys = Survey.all()
  erb(:admin)
end

post("/admin") do
  survey_name = params.fetch("survey_name")
  Survey.create({ :name => survey_name })
  @surveys = Survey.all()
  erb(:admin)
end

get("/admin/survey/:id") do
  @survey = Survey.find(params.fetch('id').to_i())
  @questions = @survey.questions()
  erb(:admin_survey)
end

get("/admin/delete/:id") do
  to_delete_survey = Survey.find(params.fetch('id').to_i())
  to_delete_survey.destroy()
  @surveys = Survey.all()
  erb(:admin)
end

patch("/admin/survey/:id") do
  @survey = Survey.find(params.fetch('id').to_i())
  @questions = @survey.questions()
  new_survey_name = params.fetch('survey_name')
  @survey.update({ :name => new_survey_name })
  erb(:admin_survey)
end

get("/admin/survey/delete/:id") do
  @survey = Survey.find(params.fetch('survey_id').to_i())
  to_delete_question = Question.find(params.fetch('id').to_i())
  to_delete_question.destroy()
  @questions = @survey.questions()
  erb(:admin_survey)
end

get("/questions/:id") do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question)
end

patch("/questions/:id") do
  @question = Question.find(params.fetch('id').to_i())
  new_question_name = params.fetch('question_name')
  @question.update({ :name => new_question_name })
  erb(:question)
end

post("/questions") do
  @survey = Survey.find(params.fetch('survey_id').to_i())
  question_name = params.fetch("question_name")
  @survey.questions().create({ :name => question_name })
  @questions = @survey.questions()
  erb(:admin_survey)
end

get("/survey/:id") do
  @survey = Survey.find(params.fetch('id').to_i())
  @questions = @survey.questions()
  erb(:survey)
end
