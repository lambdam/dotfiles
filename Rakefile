require 'rake'

desc 'create links in home directory'
task 'links' do
  Rake::Task['links:vim'].execute
  Rake::Task['links:zsh'].execute
end

desc 'create links for vim'
task 'links:vim' do
  cwd = Dir.pwd
  # First elem is source
  # Second is destination
  links = [
    %w(vimrc .vimrc),
    %w(vim .vim),
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
