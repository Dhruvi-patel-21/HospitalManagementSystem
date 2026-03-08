package dao;

import java.sql.*;
import java.util.*;
import model.Appointment;

public class AppointmentDAO {

    Connection con;

    public AppointmentDAO(Connection con) {
        this.con = con;
    }

    // ✅ ADD APPOINTMENT (FIXED)
    public void addAppointment(Appointment a) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO appointments(patient_id, doctor_id, date) VALUES (?,?,?)"
            );

            ps.setInt(1, a.getPatientId());
            ps.setInt(2, a.getDoctorId());

            // ✅ FIX: convert String to java.sql.Date
            java.sql.Date sqlDate = java.sql.Date.valueOf(a.getDate());
            ps.setDate(3, sqlDate);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ VIEW APPOINTMENTS WITH PATIENT & DOCTOR NAME
    public List<Appointment> getAllAppointments() {

        List<Appointment> list = new ArrayList<>();

        try {
            String sql =
                "SELECT a.id, a.date, " +
                "p.name AS patient_name, " +
                "d.name AS doctor_name " +
                "FROM appointments a " +
                "JOIN patients p ON a.patient_id = p.id " +
                "JOIN doctors d ON a.doctor_id = d.id";

            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Appointment a = new Appointment();
                a.setId(rs.getInt("id"));

                // convert SQL date → String
                a.setDate(rs.getDate("date").toString());

                a.setPatientName(rs.getString("patient_name"));
                a.setDoctorName(rs.getString("doctor_name"));

                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}





















/*package dao;

import java.sql.*;
import java.util.*;
import model.Appointment;

public class AppointmentDAO {
    Connection con;
    public AppointmentDAO(Connection con) { this.con = con; }

    public void addAppointment(Appointment a) {
        try {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO appointments(patient_id,doctor_id,date) VALUES(?,?,?)");
            ps.setInt(1, a.getPatientId());
            ps.setInt(2, a.getDoctorId());
            ps.setString(3, a.getDate());
            ps.executeUpdate();
        } catch (Exception e) {}
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        try {
            ResultSet rs = con.createStatement().executeQuery("SELECT * FROM appointments");
            while (rs.next()) {
                Appointment a = new Appointment();
                a.setId(rs.getInt("id"));
                a.setPatientId(rs.getInt("patient_id"));
                a.setDoctorId(rs.getInt("doctor_id"));
                a.setDate(rs.getString("date"));
                list.add(a);
            }
        } catch (Exception e) {}
        return list;
    }
}*/

