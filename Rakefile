require 'rake'
require 'erb'
require 'tmpdir'

EXCEPTIONS = {
  "vscode.settings.json" => File.expand_path("~/Library/Application Support/Code/User/settings.json")
}

def file_in_home(name)
  File.join File.expand_path(ENV['HOME']), ".#{name}"
end

def file_in_current(name)
  File.join __dir__, name
end

def file_dest(name)
  if EXCEPTIONS.has_key? name
    EXCEPTIONS[name]
  else
    file_in_home(name)
  end
end

def needs_backup f
  File.exist?(f) && !File.symlink?(f)
end

def backup_if_needed f
  dest = file_dest f
  puts "Backing up #{dest}"
  FileUtils.mv(dest, dest + ".old") if needs_backup dest
end

def symlink_file f
  backup_if_needed f
  dest = file_dest(f)
  puts "Symlinking #{f} to #{dest}"
  FileUtils.ln_s file_in_current(f), dest unless File.exists?(dest)
end

DO_NOTHING = [
  "Brewfile",
  "LICENSE",
  "README.md",
  "Rakefile",
  "config",
  "vscode_extensions"
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
  FileList["config/*"].to_a.each { |f| symlink_file f }
end

task :install_powerline_fonts do
  puts "Installing powerline fonts."
  Dir.mktmpdir do |dir|
    pwl = "#{dir}/powerline"
    puts "Downloading powerline fonts"
    system "git clone https://github.com/powerline/fonts.git #{pwl}"
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

task :brew_backup do
  `brew bundle dump --force`
end

task :brew_restore do
  `brew bundle`
end

task :vscode_extensions_backup do
  `code --list-extensions > #{file_in_current "vscode_extensions"}`
end

task :vscode_extensions_restore do
  File.foreach file_in_current("vscode_extensions") do |ext|
    puts "Installing VSCode extension #{ext}..."
    `code --install-extension #{ext}`
  end
end

task :backup => [:brew_backup, :vscode_extensions_backup]

task :restore => [:brew_restore, :vscode_extensions_restore]
