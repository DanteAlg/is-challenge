namespace :heroku do
  desc 'Integrate to heroku'

  task integrate: :environment do
    sh 'git push heroku master; heroku run rake db:migrate;'
  end
end
