begin
  namespace :db do
    desc "Populate the development database with some fake data"
    task :populate => :environment do
      5.times do
        Book.create! :title => Forgery::LoremIpsum.sentence, :thoughts => Forgery::LoremIpsum.paragraphs(3)
      end
    end
  end

rescue LoadError
  puts "Please run: sudo gem install forgery"
end


# Notes:
# This rake task will create five fake books.
# Notice I added a begin/rescue.
# When you run a rake task it looks at all possible tasks in the rake initialization.
# If you were to run any rake task before you installed the gem, rake would blow up.
# Wrapping it in an begin/rescue stop rake from aborting.
# After adding this, run the task to populate the db: "rake db:populate"
