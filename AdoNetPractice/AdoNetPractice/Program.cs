using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdoNetPractice
{
    internal class Program
    {
        static void Main(string[] args)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=.\SQLEXPRESS;Initial Catalog=NORTHWND;Integrated Security=True");
            SqlCommand cmd = conn.CreateCommand();

            cmd.CommandText = "SELECT E.EmployeeID, E.FirstName +' '+E.LastName AS Çalışan, SUM(OD.UnitPrice*Od.Quantity) AS ToplamSatış, SUM(P.UnitPrice*Od.Quantity) AS İndirimsiz FROM Orders AS O JOIN Employees AS E ON O.EmployeeID = E.EmployeeID JOIN [Order Details] AS OD ON O.OrderID = OD.OrderID JOIN Products AS P ON Od.ProductID = P.ProductID GROUP BY E.EmployeeID, E.FirstName +' '+E.LastName ORDER BY SUM(OD.UnitPrice*Od.Quantity) DESC";
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                int id = reader.GetInt32(0);
                string calisan = reader.GetString(1);
                decimal satisFiyati = reader.GetDecimal(2);
                decimal indirimsizFiyat = reader.GetDecimal(3);
                Console.WriteLine($"{id}) {calisan} {satisFiyati} TL {indirimsizFiyat} TL");
            }
            conn.Close();
        }
    }
}
