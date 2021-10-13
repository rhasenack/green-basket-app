desc 'resets heroku database'

task :reset_heroku_db do
  sh 'heroku restart'
  sh 'heroku pg:reset DATABASE'
  sh 'heroku run rails db:migrate'
  sh 'heroku run rails db:seed'
end
