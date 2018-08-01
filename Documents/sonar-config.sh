echo ##################################################
echo ############### Updating Brew ####################
echo ##################################################

brew update

echo ##################################################
echo ############### Instaling Ruby ###################
echo ##################################################

brew install rbenv ruby-build

echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
source ~/.bash_profile

rbenv install 2.4.0
rbenv global 2.4.0
rvm --default use 2.4.0
ruby -v

echo ##################################################
echo ############### Instaling Python #################
echo ##################################################

brew install python

echo ##################################################
echo ############### Instaling xcpretty ###############
echo ##################################################

git clone https://github.com/Backelite/xcpretty.git
cd xcpretty
git checkout fix/duration_of_failed_tests_workaround
gem build xcpretty.gemspec
sudo gem install --both xcpretty-0.2.2.gem

echo ##################################################
echo ############### Instaling SwiftLint ##############
echo ##################################################

brew install swiftlint

echo ##################################################
echo ############### Instaling Tailor #################
echo ##################################################

brew install tailor

echo ##################################################
echo ############### Instaling Slather ################
echo ##################################################

gem install slather

echo ##################################################
echo ############### Instaling Lizard ################
echo ##################################################

python get-pip.py

sudo pip install lizard

#echo 'export PATH=\$PATH:/$HOME/Projetos/Sonar/bin' >> ~/.zshrc
#cd /$HOME/Projetos/iOS/BaseProject-iOS
#source ~/.zshrc
