package dao;

import java.sql.*;
import java.util.*;
import model.Patient;

public class PatientDAO {

    Connection con;

    public PatientDAO(Connection con) {
        this.con = con;
    }

   
    public void addPatient(Patient p) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO patients(name, gender, age, disease) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, p.getName());
            ps.setString(2, p.getGender());
            ps.setInt(3, p.getAge());
            ps.setString(4, p.getDisease());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Patient> getAllPatients() {

        List<Patient> list = new ArrayList<>();

        try {
            ResultSet rs = con.createStatement()
                              .executeQuery("SELECT * FROM patients");

            while (rs.next()) {
                Patient p = new Patient();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setGender(rs.getString("gender"));
                p.setAge(rs.getInt("age"));
                p.setDisease(rs.getString("disease"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
