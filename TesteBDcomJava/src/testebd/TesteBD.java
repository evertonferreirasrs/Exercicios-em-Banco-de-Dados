package testebd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.spi.DirStateFactory;

public class TesteBD {

    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/teste";
        String user = "postgres";
        String password = "postgre";
        String driver = "org.postgresql.Driver";
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, user, password);
            //Statement s = conn.createStatement();
//            String sql = "INSERT INTO contato(nome, telefone)VALUES (?, ?);";
//            PreparedStatement s = conn.prepareStatement(sql);
//            s.setString(1, "Silvana");
//            s.setString(2, "(35) 3422-1111");
//            //String nome = "Silvana";
//            //String telefone = "(35) 3422-1111";
//            //s.execute("INSERT INTO contato(nome, telefone)VALUES (?, ?);");
//            s.execute();
//            s.close();
//            conn.close();

            Statement s = conn.createStatement();
            ResultSet rs = s.executeQuery("Select * FROM contato");
            while (rs.next()) {
                Long id = rs.getLong("id");
                String nome = rs.getString("nome");
                String telefone = rs.getString("telefone");
                System.out.println(id+" - "+nome+" - "+telefone);                
            }
            rs.close();
            s.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
