
begin
  require 'bones'
rescue LoadError
  abort '### Please install the "bones" gem ###'
end

task :default => 'spec'
task :test => 'spec'
task 'gem:release' => 'spec'

Bones {
  name     'guard-docbook-status'
  authors  'Rainer Volz'
  email    'dev@textmulch.de'
  url      'https://github.com/rvolz/guard-docbook-status/'
  ignore_file  '.gitignore'
  depend_on     'docbook_status'
  depend_on     'guard', '>= 1.1'
}

