require 'digest'

task :p do
  sh <<~EOH
    git add .
    git commit -m 'Update.'
    git push origin main
  EOH
end

task :sha256 do
  puts Digest::SHA256.hexdigest File.read "ip-api.tar.gz"
end