require "digest"
require "json"
require "standard/rake"

# Setting update app name
app_name = "fanyiweb"

app_version = "v#{Time.new.strftime("%Y%m%d")}"

task :fmt do
  Rake::Task["standard:fix"].invoke
end

task push: :fmt do
  sh "git add ."
  sh "git commit -m 'Update.'"
  sh "git push origin main"
end

task :package do
  Dir.glob("#{app_name}*tar.gz").each { |file| File.delete(file) }
  sh "tar zcf #{app_name}_#{app_version}.tar.gz #{app_name}"
  puts "Update app tgz [#{app_name}_#{app_version}.tar.gz] succeed!"
end

task :info do
  app_sha256 = Digest::SHA256.hexdigest File.read "#{app_name}_#{app_version}.tar.gz"
  app_info = {version: app_version, sha256: app_sha256}
  File.open("#{app_name}.json", "w") { |file| file.write(app_info.to_json) }
end

task :go do
  Rake::Task["package"].invoke
  Rake::Task["info"].invoke
end
