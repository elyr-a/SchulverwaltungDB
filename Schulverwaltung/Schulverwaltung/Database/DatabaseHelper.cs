// DB helper class

using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace SchulVerwaltung.Database
{
    public static class DatabaseHelper
    {
        // Connection string to the MySQL database
        private static readonly string ConnectionString =
            "Server=localhost;" +
            "Port=3306;" +
            "Database=schulverwaltung;" +
            "Uid=root;" +
            "Pwd=;" +        
            "CharSet=utf8mb4;";

        // Creates and opens a new MySqlConnection using the connection string
        public static MySqlConnection GetConnection()
        {
            var conn = new MySqlConnection(ConnectionString);
            conn.Open();
            return conn;
        }

        // Executes a SQL query and returns the results as a DataTable
        public static DataTable ExecuteQuery(string sql, params (string Name, object Value)[] parameters)
        {
            var table = new DataTable();
            using (var conn = GetConnection())
            using (var cmd = new MySqlCommand(sql, conn))
            {
                foreach (var (name, value) in parameters)
                    cmd.Parameters.AddWithValue(name, value ?? DBNull.Value);

                using (var adapter = new MySqlDataAdapter(cmd))
                    adapter.Fill(table);
            }
            return table;
        }

        // Executes a SQL command that modify data without returning rows
        public static int ExecuteNonQuery(string sql, params (string Name, object Value)[] parameters)
        {
            using (var conn = GetConnection())
            using (var cmd = new MySqlCommand(sql, conn))
            {
                foreach (var (name, value) in parameters)
                    cmd.Parameters.AddWithValue(name, value ?? DBNull.Value);

                return cmd.ExecuteNonQuery();
            }
        }

        // Executes an INSERT SQL command and returns the ID of the newly inserted row
        public static long ExecuteInsert(string sql, params (string Name, object Value)[] parameters)
        {
            using (var conn = GetConnection())
            using (var cmd = new MySqlCommand(sql, conn))
            {
                foreach (var (name, value) in parameters)
                    cmd.Parameters.AddWithValue(name, value ?? DBNull.Value);

                cmd.ExecuteNonQuery();
                return cmd.LastInsertedId; 
            }
        }

        // Executes a SQL command that returns a single value (first column of the first row)
        public static object ExecuteScalar(string sql, params (string Name, object Value)[] parameters)
        {
            using (var conn = GetConnection())
            using (var cmd = new MySqlCommand(sql, conn))
            {
                foreach (var (name, value) in parameters)
                    cmd.Parameters.AddWithValue(name, value ?? DBNull.Value);

                return cmd.ExecuteScalar();
            }
        }

        // Tests the database connection 
        public static bool TestConnection(out string errorMessage)
        {
            errorMessage = string.Empty;
            try
            {
                using (var conn = GetConnection())
                    return conn.State == ConnectionState.Open;
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
                return false;
            }
        }
    }
}
