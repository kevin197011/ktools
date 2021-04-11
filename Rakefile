require 'digest'

task :push do
  sh <<~SH
    git add .
    git commit -m 'Update.'
    git push origin main
  SH
end

task :package do
  Dir.glob('ip-api_v*tar.gz').each { |file| File.delete(file)}
  sh "tar zcvf ip-api_v#{Time.new.strftime("%Y%m%d") }.tar.gz ip-api"
end

task :sha256 do
  ip_api_sha256 = Digest::SHA256.hexdigest File.read "ip-api_v#{Time.new.strftime("%Y%m%d") }.tar.gz"
  File.open("ip-api.sha256", 'w') { |file| file.write("#{ip_api_sha256}") }
end

task :go do
  Rake::Task["package"].invoke
  Rake::Task["sha256"].invoke
end