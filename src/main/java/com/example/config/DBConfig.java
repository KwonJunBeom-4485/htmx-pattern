package com.example.config;

import jakarta.annotation.sql.DataSourceDefinition;
import jakarta.enterprise.context.ApplicationScoped;

@DataSourceDefinition(
    name = "java:app/jdbc/myDataSource",
    className = "org.h2.jdbcx.JdbcDataSource",
    url = "jdbc:h2:mem:test;DB_CLOSE_DELAY=-1;MODE=LEGACY",
    user = "sa",
    password = ""
)

@ApplicationScoped
public class DBConfig {

}
