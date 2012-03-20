namespace :ios do
  desc "Build iOS"
  task :build do
    #
    # 
    #
    build_script = Rails.root.join "mobileapps/iOSLauncher/build.xml"
    puts   "Building with #{build_script}"
    system "ant -f #{build_script} build"
  end

  task :package do
    build_script = Rails.root.join "mobileapps/iOSLauncher/build.xml"
    puts   "Building with #{build_script}"
    system "ant -f #{build_script} package"
  end

  task :create_publish_files do
    build_script = Rails.root.join "mobileapps/iOSLauncher/build.xml"
    puts   "Publish with #{build_script}"
    system "ant -f #{build_script} publish"
  end

  task :insert_record => :environment do
    puts MobileApp.all.inspect
  end

end
