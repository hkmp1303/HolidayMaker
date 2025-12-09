namespace server;

using Microsoft.VisualBasic;
using MySql.Data.MySqlClient;

static class CreateUser
{
    
    public record PostArgs(String Email, String Password, String Firstname, String Lastname, String Phonenumber, string Address, Enum Role);
    public static async Task 
    Post(PostArgs credentials, Config config)
    {
        string query = """
                        INSERT INTO user(email, password, firstname, lastname, phonenumber, address, `role`, fk_holidaymakerab_id)
                        VALUES (@email, @password, @firstname, @lastname, @phonenumber, @address, 'customer', 1)
                        """;
        var parameters = new MySqlParameter[]
        {
            new("@email", credentials.Email),
            new("@password", credentials.Password),
            new("@firstname", credentials.Firstname),
            new("@lastname", credentials.Lastname),
            new("@phonenumber", credentials.Phonenumber),
            new("@address", credentials.Address)
        };

        await MySqlHelper.ExecuteReaderAsync(config.ConnectionString, query, parameters);
    } 
    

}

/*
userid INT PRIMARY KEY AUTO_INCREMENT,
            
            email VARCHAR(254) NOT NULL,
            password VARCHAR(255) NOT NULL,
            firstname VARCHAR(100) NOT NULL,
            lastname VARCHAR(100) NOT NULL,
            phonenumber VARCHAR(20) NOT NULL,
            address VARCHAR(255) NOT NULL,
            role ENUM ('customer', 'admin') NOT NULL,
            
            
            fk_holidaymakerab_id INT,
            FOREIGN KEY(fk_holidaymakerab_id) REFERENCES holidaymakerab(holidaymakerabid)
*/