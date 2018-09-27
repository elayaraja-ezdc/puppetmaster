class ihis {
  mysql::db { 'dbtwo':
   user     => 'user1',
   password => 'user1',
   host     => 'node1.arklab.local',
  }

  mysql_user { 'user2@localhost':
    ensure                   => 'present',
    max_connections_per_hour => '60',
    max_queries_per_hour     => '120',
    max_updates_per_hour     => '120',
    max_user_connections     => '10',
  }
}
