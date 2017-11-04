using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DataProvider
/// </summary>
public static class DataProvider
{
	public static string  connString = @"Data Source=.\SQLEXPRESS; Initial Catalog=MyTest; Integrated Security=true";

    public static DataTable ExcuteQuery(string query)
    {
        DataTable data = new DataTable();

        using (var conn = new SqlConnection(connString))
        {
            var adapter = new SqlDataAdapter(new SqlCommand(query, conn));
            conn.Open();
            adapter.Fill(data);
        }

        return data;
    }

    public static bool ExcuteNonQuery(string query)
    {
        bool isOk = false;

        using (var conn = new SqlConnection(connString))
        {
            var cmd = new SqlCommand(query, conn);
            conn.Open();
            isOk = cmd.ExecuteNonQuery() > 0;
        }

        return isOk;
    }

    public static object ExcuteScalar(string query)
    {
        object data;

        using (var conn = new SqlConnection(connString))
        {
            var cmd = new SqlCommand(query, conn);
            conn.Open();
            data = cmd.ExecuteScalar();
        }

        return data;
    }
}