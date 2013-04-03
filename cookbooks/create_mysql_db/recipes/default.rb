bash "really awesome way to create a mysql database from chef using the bash method" do

  # dont if the db already exists
  not_if("/usr/bin/mysql -uroot -pmiller_highlife_lol_jk -e'show databases' | grep #{node[:create_mysql_db][:db_name]}", :user => 'hto')

  # run as the hto user
  user "hto"

  # a heredoc of the code to execute, note the node hash is created from the JSON file
  code <<-HEY_BRO_EOM
  mysql -uroot -ppmiller_highlife_lol_jk -e 'create database #{node[:create_mysql_db][:db_name]}'
  HEY_BRO_EOM
end
