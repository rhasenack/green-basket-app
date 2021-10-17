desc 'resets heroku database'

task :reset_heroku_db do
  sh 'heroku restart'
  sh 'heroku pg:reset DATABASE --confirm green-basket-app'
  sh 'heroku run rails db:migrate'
  sh 'heroku run rails db:seed'
end
