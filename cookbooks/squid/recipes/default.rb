#
# Cookbook Name:: squid
# Recipe:: default
#
if ['solo', 'app_master', 'app'].include?(node[:instance_role])

  # be sure to replace "app_name" with the name of your application.
  run_for_app("change_production") do |app_name, data|
    
    package "squid"
    
    template "/data/#{app_name}/shared/config/proxy.yml" do
      owner node[:owner_name]
      group node[:owner_name]
      mode 0644
      source "proxy.yml.erb"
      variables({
        :proxy_host => node[:master_app_server][:private_dns_name]
      })
    end
    
    link "/data/#{app_name}/current/config/proxy.yml" do
        to "/data/#{app_name}/shared/config/proxy.yml"
    end
  end
end    

if ['solo', 'app_master'].include?(node[:instance_role])
  execute "add-squid-to-default-run-level" do
    command %Q{
      rc-update add squid default
    }
    not_if "rc-status | grep squid"
  end
end