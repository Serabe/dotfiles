require 'rake'
require 'erb'

def file_in_home(name)
  File.join File.expand_path(ENV['HOME']), ".#{name}"
end

def file_in_current(name)
  File.join __dir__, name
end

def needs_backup f
  File.exist?(f) && !File.symlink?(f)
end

def backup_if_needed f
  home_file = file_in_home f
  puts "Backing up #{home_file}"
  FileUtils.mv(home_file, home_file + ".old") if needs_backup home_file
end

def symlink_file f
  backup_if_needed f
  puts "Symlinking #{f}"
  FileUtils.ln_s file_in_current(f), file_in_home(f)
end

DO_NOTHING = [
  "Rakefile"
]

task :symlink_files do
  FileList["*"].to_a.reject do |f|
    f.end_with?('.erb') || DO_NOTHING.include?(f)
  end.find_all do |f|
    File.file?(f)|| File.directory?(f)
  end.each do |f|
    symlink_file f
  end
end

task :default => [:symlink_files]
