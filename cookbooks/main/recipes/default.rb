execute "testing" do
  command %Q{
    echo "i ran at #{Time.now}" >> /root/cheftime
  }
end

# uncomment if you want to run couchdb recipe
# require_recipe "couchdb"

# uncomment to turn use the MBARI ruby patches for decreased memory usage and better thread/continuationi performance
# require_recipe "mbari-ruby"

# uncomment to turn on thinking sphinx 
require_recipe "thinking_sphinx"
require_recipe "cron"
require_recipe "crontab_mailto"
require_recipe "backgroundrb"
require_recipe "memcached"
require_recipe "ar_sendmail"

require_recipe "squid"


# uncomment to turn on ultrasphinx 
# require_recipe "ultrasphinx"
