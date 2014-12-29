#Install environment dependences
apt_package "python-software-properties" do
  action :install
end

#Install environment Java
java_packages = ['java-common', 
                'gsfonts', 
                'gsfonts-x11',
                'libfontenc1', 
                'libxfont1', 
                'x11-common', 
                'xfonts-encodings',
                'xfonts-utils']
java_packages.each do |p|
  apt_package p do
    action :install
  end
end

execute "add-apt-repository" do
  command "add-apt-repository ppa:webupd8team/java"
end
execute "accepted-oracle-license-v1-1" do
  command "echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections"
end
execute "apt-get update" do 
  command "apt-get update" 
end
execute "apt-get clean" do 
  command "apt-get clean" 
end

execute "install oracle-java8-installer" do
  command "apt-get -y install oracle-java8-installer"
end

execute "install oracle-java8-set-default" do
  command "apt-get -y install oracle-java8-set-default"
end