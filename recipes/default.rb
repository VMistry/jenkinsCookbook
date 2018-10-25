apt_repository "PPA_Java" do
  uri "ppa:webupd8team/java"
end

apt_update 'update' do
  action  :update
end

# Install Java 8
package("openjdk-8-jdk") do
  action :install
end

# Add Jenkins to the repo list
apt_repository "add_jenkins" do
  key "https://pkg.jenkins.io/debian-stable/jenkins.io.key"
  uri "http://pkg.jenkins.io/debian-stable"
  distribution "binary/"
  action :add
end

# Update resources after Jenkins added
apt_update("update") do
  action :update
end

# Install Jenkins
package("jenkins") do
  action :install
end

# Start Jenkins
service("jenkins") do
  action [:enable, :start]
end
