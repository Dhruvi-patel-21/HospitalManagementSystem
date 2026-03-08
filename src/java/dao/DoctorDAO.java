package dao;

import java.sql.*;
import java.util.*;
import model.Doctor;

public class DoctorDAO {
    Connection con;
    public DoctorDAO(Connection con) { this.con = con; }

    public void addDoctor(Doctor d) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO doctors(name,specialization) VALUES(?,?)");
            ps.setString(1, d.getName());
            ps.setString(2, d.getSpecialization());
            ps.executeUpdate();
        } catch (Exception e) {}
    }

    public List<Doctor> getAllDoctors() {
        List<Doctor> list = new ArrayList<>();
        try {
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM doctors");
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setId(rs.getInt("id"));
                d.setName(rs.getString("name"));
                d.setSpecialization(rs.getString("specialization"));
                list.add(d);
            }
        } catch (Exception e) {}
        return list;
    }
}
