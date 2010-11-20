namespace :rapid do
  desc "update some of the dependencies"
  task :update do
    system "curl https://github.com/documentcloud/underscore/raw/master/underscore-min.js > #{ Rails.root }/public/javascripts/underscore-min.js"
    system "curl https://github.com/documentcloud/backbone/raw/master/backbone-min.js > #{ Rails.root }/public/javascripts/backbone-min.js"
  end
end
