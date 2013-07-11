include_recipe "apache2"

template "#{node['apache']['dir']}/sites-available/icinga" do
  source "apache.conf.erb"
  notifies :reload, "service[apache2]"
end

file "/etc/apache2/conf.d/icinga.conf" do
  action :delete
end

apache_site "icinga"
