require 'rake'

def command?(name)
  `which #{name}`
  $?.success?
end

desc 'create links in home directory'
task 'links' do
  Rake::Task['links:vim'].execute
  Rake::Task['links:zsh'].execute
  Rake::Task['links:git'].execute
end

desc 'create links for vim'
task 'links:vim' do
  unless command? 'ruby'
    puts 'Please install ruby'
    break
  end
  cwd = Dir.pwd
  # First elem is source
  # Second is destination
  links = [
    %w(vimrc .vimrc),
    %w(gvimrc .gvimrc)
  ]
  # Create vim folder if doesn't exist
  system "mkdir -p ~/.vim/bundle" unless File.exist? "#{Dir.home}/.vim/bundle"
  # Create links
  links.each do |infos|
    system "rm -rf ~/#{infos[1]}"
    system "ln -s #{cwd}/#{infos[0]} ~/#{infos[1]}"
  end
end

desc 'create links for ZSH'
task 'links:zsh' do
  system "rm -rf ~/.zshrc"
  system "ln -s #{Dir.pwd}/zshrc ~/.zshrc"
end

desc 'create links for git'
task 'links:git' do
  pwd = Dir.pwd
  system "rm ~/.gitconfig ~/.gitignore_global"
  system "ln -s #{pwd}/gitconfig ~/.gitconfig"
  system "ln -s #{pwd}/gitignore_global ~/.gitignore_global"
end
