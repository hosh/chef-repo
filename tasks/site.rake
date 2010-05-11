
SITE_COOKBOOKS = %w(
  gentoo
  nginx
  monit
)

desc "Update and push entire stack"
task :upload do 
  Rake::Task['upload_cookbook'].invoke(SITE_COOKBOOKS.join(' '))
  Rake::Task['roles'].invoke
  Rake::Task['databags:load'].invoke
end
