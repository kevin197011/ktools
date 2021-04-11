require 'digest'

task :push do
  sh <<~SH
    git add .
    git commit -m 'Update.'
    git push origin main
  SH
end

task :sha256 do
  puts Digest::SHA256.hexdigest File.read "ip-api_v#{Time.new.strftime("%Y%m%d") }.tar.gz"
end

task :package do
  Dir.glob('ip-api_v*tar.gz').each { |file| File.delete(file)}
  sh "tar zcvf ip-api_v#{Time.new.strftime("%Y%m%d") }.tar.gz ip-api"
end