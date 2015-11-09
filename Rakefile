require 'rake'
require 'erb'
require 'tmpdir'

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
  FileUtils.ln_s file_in_current(f), file_in_home(f) unless File.exists?(file_in_home(f))
end

DO_NOTHING = [
  "Rakefile",
  "README.md",
  "LICENSE"
]

task :symlink_files do
  FileList["*"].to_a.reject do |f|
    f.end_with?('.erb') || DO_NOTHING.include?(f)
  end.find_all do |f|
    File.file?(f) || File.directory?(f)
  end.reject do |f|
    f.start_with?("IO")
  end.each do |f|
    symlink_file f
  end
end

task :install_powerline_fonts do
  puts "Installing powerline fonts."
  Dir.mktmpdir do |dir|
    pwl = "#{dir}/powerline"
    puts "Downloading powerline fonts"
    system "git clone git@github.com:Lokaltog/powerline-fonts.git #{pwl}"
    puts "Copying fonts to system"
    system "#{pwl}/install.sh"
    puts "Done"
  end
end

task :set_up_vundle do
  `git clone https://github.com/gmarik/Vundle.vim.git ./vim/bundle/Vundle.vim`
  `vim +PluginInstall +qall`
end

task :set_neovim do
  `ln -s ~/.vim ~/.config/nvim`
  `ln -s ~/.vimrc ~/.config/nvim/init.vim`
end

task :default => [:symlink_files, :install_powerline_fonts, :set_up_vundle, :set_neovim]

task :brew_tap_backup do
  puts "Backing up taps"
  `brew tap > #{file_in_current "brew_taps"}`
end

task :brew_tap_restore do
  `cat #{file_in_current "brew_taps"} | xargs -n1 brew tap`
end

task :brew_formula_backup do
  puts "Backing up installed formulas"
  `brew list > #{file_in_current "brew_formulas"}`
end

task :brew_formula_restore do
  `brew install $(cat #{file_in_current "brew_formulas"} | tr '\n' ' ')`
end

task :brew_backup => [:brew_tap_backup, :brew_formula_backup]
task :brew_restore => [:brew_tap_restore, :brew_formula_restore]

task :backup => [:brew_backup]

task :restore => [:brew_restore]
